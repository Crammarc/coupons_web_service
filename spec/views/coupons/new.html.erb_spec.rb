require 'spec_helper'

describe "coupons/new.html.erb" do
  before(:each) do
    assign(:coupon, stub_model(Coupon,
      :coupon_type_id => 1,
      :client_user => "MyString",
      :client_comment => "MyString",
      :consuming_partner => "MyString"
    ).as_new_record)
  end

  it "renders new coupon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coupons_path, :method => "post" do
      assert_select "input#coupon_coupon_type_id", :name => "coupon[coupon_type_id]"
      assert_select "input#coupon_client_user", :name => "coupon[client_user]"
      assert_select "input#coupon_client_comment", :name => "coupon[client_comment]"
      assert_select "input#coupon_consuming_partner", :name => "coupon[consuming_partner]"
    end
  end
end
