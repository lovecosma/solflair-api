class Cart < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :items
    accepts_nested_attributes_for :items
    has_many :cart_items
end
