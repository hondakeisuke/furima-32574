class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_free
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :items_name
    validates :explanation
    validates :image
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_free_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  VALID_PASSWORD_REGEX = /\A[0-9]+\z/.freeze
  validates :price, presence: true, format: { with: VALID_PASSWORD_REGEX },numericality: { greater_than: 299, less_than: 10000000 }
end
