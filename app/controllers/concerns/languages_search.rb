module LanguagesSearch
  extend ActiveSupport::Concern

  def search_language_no_one_use
    Language.left_outer_joins(:guides).where(guides: {id: nil})
  end
end