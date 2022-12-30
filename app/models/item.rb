class Item < ApplicationRecord

    has_one_attached :image

    validates :name,           presence:true
    validates :introduction,   presence:true

end
