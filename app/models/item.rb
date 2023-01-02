class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :contributor
    belongs_to :genre

    validates :name,           presence:true
    validates :introduction,   presence:true

end
