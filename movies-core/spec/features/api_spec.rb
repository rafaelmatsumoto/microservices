require 'rails_helper.rb'

feature "general API stuff" do
  scenario "good request" do
    headers = TestHeaders.new
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response.response_code).to eq(201)
    expect(JSON.parse(response.body)["ping"]["status"]).to eq("ok")
  end

  scenario "good request to v2" do
    headers = TestHeaders.new(version: 2)
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response.response_code).to eq(201)
    expect(JSON.parse(response.body)["ping"]["status_v2"]).to eq("ok")
  end

  scenario "good request with custom status" do
    headers = TestHeaders.new
    post("/api/ping", params: { status: 200 }.to_json, headers: headers.headers)

    expect(response.response_code).to eq(200)
    expect(JSON.parse(response.body)["ping"]["status"]).to eq("ok")
  end

  scenario "request with user error" do
    headers = TestHeaders.new
    post("/api/ping", params: { error: "OH NOES!" }.to_json, headers: headers.headers)

    expect(response).to have_api_error(code: "test", message: "OH NOES!")
  end

  scenario "no auth header given" do
    headers = TestHeaders.new(api_client: nil)
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response).to have_auth_error
  end

  scenario "weird auth header given" do
    headers = TestHeaders.new(api_client: ["Basic","foo:bar"])
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response).to have_auth_error
  end

  scenario "bad key given" do
    headers = TestHeaders.new(api_client: "foobar")
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response).to have_auth_error
  end

  scenario "no version" do
    headers = TestHeaders.new(version: nil)
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response.response_code).to eq(406)
  end

  scenario "version we don't support" do
    headers = TestHeaders.new(version: 999)
    expect {
      post("/api/ping", params: {}.to_json, headers: headers.headers)
    }.to raise_error(ActionController::RoutingError)
  end

  scenario "wrong mime type" do
    headers = TestHeaders.new(mime_type: "application/foobar")
    post("/api/ping", params: {}.to_json, headers: headers.headers)

    expect(response.response_code).to eq(406)
  end

  RSpec::Matchers.define :have_auth_error do
    match do |response|
      correct_code,correct_header = evaluate_response(response)
      correct_code && correct_header
    end

    failure_message do
      correct_code,_ = evaluate_response(response)
      if correct_code
        "Expected WWW-Authenticate header to be 'CustomKeyAuth realm=#{realm}', but was #{response['WWW-Authenticate']}"
      else
        "Expected response to be 401, but was #{response.response_code}"
      end
    end

    def realm
     Rails.application.class.module_parent.to_s

    end

    def evaluate_response(response)
      [response.response_code == 401, response.headers["WWW-Authenticate"] == "CustomKeyAuth realm=#{realm}"]
    end
  end
end
