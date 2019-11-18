class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :destroy]

    def index
        @orders = Order.joins(:movie).select('orders.id, orders.user_email, orders.price, orders.created_at, movies.name')
        render json: @orders
    end

    def show
        render json: @order
    end

    def create
        @order = Order.new(order_params)

        if @order.save
            send_email_request(@order.user_email)
            render json: @order, status: :created
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    private 

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(:user_email, :price, :movie_id)
    end

    def send_email_request(user_email)
        email_json = JSON.generate({"email" => user_email})
        res = Faraday.post('http://localhost:5000', email_json, "Content-Type" => "application/json")
    end

end
