require 'rails_helper'

RSpec.describe Language, type: :model do

  before(:each) do
    @language = create(:language)
  end

  it 'should be valid with valid attribute' do
    expect(@language).to be_valid
  end

  it 'should have unique code' do
    expect { create(:language, code: 'vn') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have code attribute' do
    @language.code = nil
    expect(@language).to_not be_valid
  end

  it "should have many and belong to many guides" do
    t = Language.reflect_on_association(:guides)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end
end
