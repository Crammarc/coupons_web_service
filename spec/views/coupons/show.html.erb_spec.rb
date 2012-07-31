require 'spec_helper'

describe "coupons/show.html.erb" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon,
      :coupon_type_id => 1,
      :client_user => "Client User",
      :client_comment => "Client Comment",
      :consuming_partner => "Consuming Partner"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client User/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client Comment/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Consuming Partner/)
  end
end
