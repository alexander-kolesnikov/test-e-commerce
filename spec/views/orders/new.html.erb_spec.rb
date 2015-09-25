require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :email => "MyString",
      :total => "9.99"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_email[name=?]", "order[email]"

      assert_select "input#order_total[name=?]", "order[total]"
    end
  end
end