require 'spec_helper'

describe "coupon_types/new.html.erb" do
  before(:each) do
    assign(:coupon_type, stub_model(CouponType,
      :friendly_name => "MyString",
      :partner_name => "MyString",
      :description => "MyString",
      :discount_percentage => 1,
      :available_coupons => 1
    ).as_new_record)
  end

  it "renders new coupon_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coupon_types_path, :method => "post" do
      assert_select "input#coupon_type_friendly_name", :name => "coupon_type[friendly_name]"
      assert_select "input#coupon_type_partner_name", :name => "coupon_type[partner_name]"
      assert_select "input#coupon_type_description", :name => "coupon_type[description]"
      assert_select "input#coupon_type_discount_percentage", :name => "coupon_type[discount_percentage]"
      assert_select "input#coupon_type_available_coupons", :name => "coupon_type[available_coupons]"
    end
  end
end
