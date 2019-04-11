require 'rails_helper'

RSpec.describe Guide, type: :model do

  before(:each) do
    @guide = create(:guide)
  end

  it "is valid with valid email" do
    expect(@guide).to be_valid
  end

  it "is raising error when created by an already existed email" do
    same_email = @guide.email
    expect { create(:guide, email: same_email) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is raising error when created without email" do
    expect { create(:guide, email: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should have many reviews" do
    t = Guide.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many and belong to many activities" do
    t = Guide.reflect_on_association(:activities)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end

  it "should have many and belong to many languages" do
    t = Guide.reflect_on_association(:languages)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end
end
