class ShopViewHistory < ApplicationRecord
  validates_numericality_of :count, greater_than_or_equal_to: 0
end
