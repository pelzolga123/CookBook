class Post < ApplicationRecord
    belongs_to :user
    validates :content, presence: true
    has_many :recipes, foreign_key: :post_id, dependent: :destroy
    accepts_nested_attributes_for :recipes, allow_destroy: true
end
