# frozen_string_literal: true

# == Schema Information
#
# Table name: real_estates
#
#  id              :bigint           not null, primary key
#  building        :string           not null
#  check_in        :datetime         not null
#  check_out       :datetime         not null
#  city            :string           not null
#  country         :string           not null
#  price           :decimal(8, 2)    not null
#  property_status :integer          default("available"), not null
#  property_type   :integer          default("apartment"), not null
#  rating          :float            default(0.0), not null
#  street          :string           not null
#  zip             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
RSpec.describe RealEstate, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: false) }
    it { is_expected.to have_db_column(:country).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:city).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:street).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:building).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:rating).of_type(:float).with_options(default: 0.0) }
    it { is_expected.to have_db_column(:check_in).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:check_out).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:property_type).of_type(:integer).with_options(default: :apartment) }
    it { is_expected.to have_db_column(:property_status).of_type(:integer).with_options(default: :available) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:real_estate_property).dependent(:destroy) }
  end
end
