require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :email => "MyString",
      :total => "9.99"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_email[name=?]", "order[email]"

      assert_select "input#order_total[name=?]", "order[total]"
    end
  end
end
