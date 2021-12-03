# frozen_string_literal: true

# == Schema Information
#
# Table name: owners
#
#  id              :uuid             not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_owners_on_email  (email) UNIQUE
#
RSpec.describe Owner, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:first_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:last_name).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:real_estates).dependent(:destroy) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:email) }
  end
end
