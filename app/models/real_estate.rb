class RealEstate < ApplicationRecord
  has_one: real_estate_properties

  enum property_type: [ :apartment ]
  enum property_status: [ :available ]
end
