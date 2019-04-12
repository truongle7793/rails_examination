require 'rails_helper'

class FakesController < ApplicationController
end

RSpec.describe FakesController, type: :controller do
  include LanguagesSearch

  it "return only language that no one use" do
    #create language that does not being used
    create(:language)

    #create new language that being used
    language_being_used = create(:language, code: 'en')
    user = create(:guide)
    user.languages << language_being_used

    search_results = search_language_no_one_use

    expect(search_results).to_not include(language_being_used)
  end
end