module GuidesSearch
  extend ActiveSupport::Concern

  def search(arg)
    return Guide.includes(:languages, :activities) if !arg[:language].present? & !arg[:activity].present?

    query = Guide.includes(:languages, :activities)

    # languages = arg[:language].strip.split(',')
    # activities = arg[:activity].strip.split(',')
    #
    # query = query.where(id: Guide.joins(:languages, :activities).select("guides.id")
    #                             .where('languages.code': languages)
    #                             .where('activities.name': activities)
    #                             .group('guides.id')
    #                             .having('count(guides.id) = ?',languages.count * activities.count))

    if arg[:language].present?
      languages = arg[:language].strip.split(',')

      # query = query.where(languages: { code: languages })

      query = query.where(id: Guide.joins(:languages)
                                  .where('languages.code': languages)
                                  .group('guides.id')
                                  .having('count(guides.id) = ?',languages.count))
    end

    if arg[:activity].present?
      activities = arg[:activity].strip.split(',')

      query = query.where(id: Guide.joins(:activities)
                                  .where('activities.name': activities)
                                  .group('guides.id')
                                  .having('count(guides.id) = ?',activities.count))
    end

    query
    # raise
  end
end