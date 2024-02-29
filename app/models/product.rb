# frozen_string_literal: true

# Description/Explanation of the class
class Product < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :user_id, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true
end
