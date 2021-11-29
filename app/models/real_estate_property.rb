# frozen_string_literal: true

# == Schema Information
#
# Table name: real_estate_properties
#
#  id             :uuid             not null, primary key
#  backyard       :boolean          default(FALSE)
#  bath           :integer          default(0), not null
#  bed            :integer          default(0), not null
#  bed_room       :integer          default(0), not null
#  description    :string           not null
#  guests         :integer          default(1), not null
#  kitchen        :boolean          default(FALSE)
#  parking        :boolean          default(FALSE)
#  pets_allowed   :boolean          default(FALSE)
#  wifi           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  real_estate_id :bigint
#
# Indexes
#
#  index_real_estate_properties_on_real_estate_id  (real_estate_id)
#
class RealEstateProperty < ApplicationRecord
  belongs_to :real_estate
end
