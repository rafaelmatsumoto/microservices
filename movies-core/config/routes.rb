Rails.application.routes.draw do
  namespace :api do
    resources :movies
    resources :genres
  end
namespace :api do
  scope module: :v1, constraints: Stitches::ApiVersionConstraint.new(1) do
    resource 'ping', only: [ :create ]
    # Add your V1 resources here
  end
  scope module: :v2, constraints: Stitches::ApiVersionConstraint.new(2) do
    resource 'ping', only: [ :create ]
    # This is here simply to validate that versioning is working
    # as well as for your client to be able to validate this as well.
  end
end

api_docs = Rack::Auth::Basic.new(Apitome::Engine) do |_, password|
  password == ENV['HTTP_AUTH_PASSWORD']
end
mount api_docs, at: "docs"
end
