require 'spec_helper'

describe "coupons/edit.html.erb" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon,
      :coupon_type_id => 1,
      :client_user => "MyString",
      :client_comment => "MyString",
      :consuming_partner => "MyString"
    ))
  end

  it "renders the edit coupon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coupon_path(@coupon), :method => "post" do
      assert_select "input#coupon_coupon_type_id", :name => "coupon[coupon_type_id]"
      assert_select "input#coupon_client_user", :name => "coupon[client_user]"
      assert_select "input#coupon_client_comment", :name => "coupon[client_comment]"
      assert_select "input#coupon_consuming_partner", :name => "coupon[consuming_partner]"
    end
  end
end
