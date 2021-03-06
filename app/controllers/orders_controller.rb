class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }

        @basket = cookies["basket"] ? ActiveSupport::JSON.decode(cookies["basket"]) : {}
        @basket.each do |order_position|
          @product = Product.find(order_position[0])
          if order_position[1] > 0 then
            if order_position[1] > @product.stock_level then
              order_position[1] = @product.stock_level
            end
            @order_detail = OrderDetail.new(order: @order, product_id: order_position[0], qty: order_position[1])
            if @order_detail.save then
              @product.update!(stock_level: @product.stock_level - order_position[1])
            end  
          end
        end
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    cookies["basket"] = "{}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :total)
    end
end