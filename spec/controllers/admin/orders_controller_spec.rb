require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  let(:valid_attributes) {
    {email: "test@email.com", total: "1235.54"}
  }

  let(:invalid_attributes) {
    {email: "test#email,com", total: "-1235.54"}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

end
