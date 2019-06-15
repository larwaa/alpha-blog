class Category < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 30 }, presence: true, uniqueness: true
end