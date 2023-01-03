class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :contributor
    belongs_to :genre, optional: true

    validates :name,           presence:true
    validates :introduction,   presence:true

end
