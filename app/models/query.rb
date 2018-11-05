class Query < ApplicationRecord
  belongs_to :user, dependent: :destroy,
    counter_cache: true #queries_count

  validates :search_term, presence: true, length: {in: 0..50}
end
