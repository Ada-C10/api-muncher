class Query < ApplicationRecord
  belongs_to: :user

  validates :search_term, presence: true, length: {in: 0..50}
end
