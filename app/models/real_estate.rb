# frozen_string_literal: true

# == Schema Information
#
# Table name: real_estates
#
#  id              :uuid             not null, primary key
#  building        :string           not null
#  check_in        :datetime         not null
#  check_out       :datetime         not null
#  city            :string           not null
#  country         :string           not null
#  price           :decimal(8, 2)    not null
#  property_status :integer          default("available"), not null
#  property_type   :integer          default("apartment"), not null
#  rating          :float            default(0.0), not null
#  rentable_type   :string
#  street          :string           not null
#  zip             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  rentable_id     :uuid
#
# Indexes
#
#  index_real_estates_on_rentable  (rentable_type,rentable_id)
#
class RealEstate < ApplicationRecord
  belongs_to :rentable, polymorphic: true
  has_one :real_estate_property, dependent: :destroy

  enum property_type: { apartment: 0 }
  enum property_status: { available: 0 }
end
