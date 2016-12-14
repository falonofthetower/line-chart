require 'rails_helper'

RSpec.describe Consumption, type: :model do
  it { is_expected.to validate_numericality_of(:sunday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:monday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:tuesday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wednesday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:thursday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:friday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:saturday).is_greater_than(-1).is_less_than(11) }
  it { is_expected.to belong_to(:user) }

  context "default values" do
    it "sets the default value for all the days to 0" do
      user = FactoryGirl.create(:user)
      consumption = Consumption.create(user: user)
      expect(consumption.sunday).to eq 0
      expect(consumption.monday).to eq 0
      expect(consumption.tuesday).to eq 0
      expect(consumption.wednesday).to eq 0
      expect(consumption.thursday).to eq 0
      expect(consumption.friday).to eq 0
      expect(consumption.saturday).to eq 0
    end
  end

  describe "data" do
    it "returns an array of the data ordered by sunday - saturday" do
      consumption = FactoryGirl.create(:consumption,
                                       monday: 1,
                                       tuesday: 4,
                                       wednesday: 3,
                                       thursday: 5,
                                       friday: 7,
                                       saturday: 9,
                                       sunday: 10
                                      )

      expect(consumption.day_set).to eq([10, 1, 4, 3, 5, 7, 9])
    end
  end
end
