class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to_active_hash :shipping_cost, class_name: 'ShippingCost'
  belongs_to :prefecture
  belongs_to :number_of_days


  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id,
    numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id,
    numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_cost_id,
    numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id,
    numericality: { other_than: 1 , message: "can't be blank"}
    validates :number_of_days_id,
    numericality: { other_than: 1 , message: "can't be blank"}
    validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  validates_format_of :price, with: /\A[0-9]+\z/, message: "should contain only half-width numerals"
end
    
