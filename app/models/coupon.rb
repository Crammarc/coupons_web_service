class Coupon
  include Mongoid::Document
  field :coupon_type_id, :type => Integer
  field :client_user, :type => String
  field :client_comment, :type => String
  field :created_at, :type => Time
  field :used_date, :type => Time
  field :consuming_partner, :type => String
end
