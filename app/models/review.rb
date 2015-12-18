class Review < ActiveRecord::Base
  belongs_to :bathroom

  validates :rating, presence: true
  validates :body, presence: true
  validates :bathroom_id, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "Must be between 1 - 5"
  }

end
