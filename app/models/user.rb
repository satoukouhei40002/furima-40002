class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :family_name,
              format: { with: /\A([ぁ-んァ-ン一-龥々ヴー]|ー)+\z/ }
    validates :first_name,
              format: { with: /\A([ぁ-んァ-ン一-龥々ヴー]|ー)+\z/ }
    validates :family_name_kana,
              format: { with: /\A([ァ-ヴー])+\z/ }
    validates :first_name_kana,
              format: { with: /\A([ァ-ヴー])+\z/ }
    validates :birth
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'must include both Letters and Numbers' }
end
