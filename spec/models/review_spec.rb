require 'rails_helper'

RSpec.describe Review, type: :model do

  before(:each) do
    @review = create(:review)
  end

  it 'should be valid with correct attributes' do
    expect(@review).to be_valid
  end

  context 'score should have score numericality and is greater than 0 and less or equal to 5' do
    it 'should not be string' do
      @review.score = 'string'
      expect(@review).to_not be_valid
    end

    it 'should be greater than 0 and less than 5' do
      @review.score = 0
      expect(@review).to_not be_valid

      @review.score = 6
      expect(@review).to_not be_valid
    end
  end

  it 'must belong to user' do
    expect { create(:review) }.to_not raise_error(ActiveRecord::RecordInvalid)

    #remove guide
    @review.guide = nil
    expect(@review).to_not be_valid
  end

  it "should belong to guide" do
    t = Review.reflect_on_association(:guide)
    expect(t.macro).to eq(:belongs_to)
  end
end
