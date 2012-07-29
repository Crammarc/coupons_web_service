require 'spec_helper'

describe "coupon_types/index.html.erb" do
  before(:each) do
    assign(:coupon_types, [
      stub_model(CouponType,
        :friendly_name => "Friendly Name",
        :partner_name => "Partner Name",
        :description => "Description",
        :discount_percentage => 1,
        :available_coupons => 1
      ),
      stub_model(CouponType,
        :friendly_name => "Friendly Name",
        :partner_name => "Partner Name",
        :description => "Description",
        :discount_percentage => 1,
        :available_coupons => 1
      )
    ])
  end

  it "renders a list of coupon_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Friendly Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partner Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
