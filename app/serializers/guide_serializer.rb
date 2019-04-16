class GuideSerializer
  include FastJsonapi::ObjectSerializer

  has_many :languages
  has_many :activities

  attributes :email, :updated_at
end
