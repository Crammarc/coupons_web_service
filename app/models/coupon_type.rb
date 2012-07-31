class CouponType
  include Mongoid::Document
  field :friendly_name, :type => String
  field :partner_name, :type => String
  field :description, :type => String
  field :discount_percentage, :type => Integer
  field :expiration_date, :type => Time
  field :available_coupons, :type => Integer
end
