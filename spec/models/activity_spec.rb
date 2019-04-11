require 'rails_helper'

RSpec.describe Activity, type: :model do

  before(:each) do
    @activity = create(:activity)
  end

  it 'should be valid with valid attribute' do
    expect(@activity).to be_valid
  end

  it 'should have name attribute' do
    @activity.name = nil
    expect(@activity).to_not be_valid
  end

  it 'should have unique name attribute' do
    expect { create(:activity, name: 'Swimming') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should have many and belong to many guides" do
    t = Activity.reflect_on_association(:guides)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end
end
