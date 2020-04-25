class Recipe < ApplicationRecord
    belongs_to :post, optional: true
    validates :ingredient_name, presence: true
    validates :measurement, presence: true
end
