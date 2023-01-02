class Item < ApplicationRecord

    has_one_attached :image

    has_many :contributors, dependent: :destroy

    validates :name,           presence:true
    validates :introduction,   presence:true

end
