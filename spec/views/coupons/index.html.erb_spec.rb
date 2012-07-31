require 'spec_helper'

describe "coupons/index.html.erb" do
  before(:each) do
    assign(:coupons, [
      stub_model(Coupon,
        :coupon_type_id => 1,
        :client_user => "Client User",
        :client_comment => "Client Comment",
        :consuming_partner => "Consuming Partner"
      ),
      stub_model(Coupon,
        :coupon_type_id => 1,
        :client_user => "Client User",
        :client_comment => "Client Comment",
        :consuming_partner => "Consuming Partner"
      )
    ])
  end

  it "renders a list of coupons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client Comment".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Consuming Partner".to_s, :count => 2
  end
end
