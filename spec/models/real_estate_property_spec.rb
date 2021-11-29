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
RSpec.describe RealEstateProperty, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:guests).of_type(:integer).with_options(default: 1, null: false) }
    it { is_expected.to have_db_column(:bed_room).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:bed).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:bath).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:kitchen).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:wifi).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:parking).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:backyard).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:pets_allowed).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:real_estate) }
  end
end
