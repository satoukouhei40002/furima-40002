class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :number_of_days


  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true}
  end
  validates :category_id,
  numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,
  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id,
  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,
  numericality: { other_than: 1, message: "can't be blank" }
  validates :number_of_days_id,
  numericality: { other_than: 1, message: "can't be blank"}

end
