class Guide < ApplicationRecord
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :activities

  has_many :reviews, dependent: :destroy

  validates :email, presence: true, uniqueness: true

end
