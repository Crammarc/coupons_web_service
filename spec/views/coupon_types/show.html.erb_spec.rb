require 'spec_helper'

describe "coupon_types/show.html.erb" do
  before(:each) do
    @coupon_type = assign(:coupon_type, stub_model(CouponType,
      :friendly_name => "Friendly Name",
      :partner_name => "Partner Name",
      :description => "Description",
      :discount_percentage => 1,
      :available_coupons => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Friendly Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Partner Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
