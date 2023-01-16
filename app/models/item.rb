class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :contributor
    has_many :comments,    dependent: :destroy
    belongs_to :genre, optional: true
    has_many :favorites,   dependent: :destroy


    def favorited_by?(customer)
        favorites.exists?(customer_id: customer.id)
    end

    validates :name,           presence:true
    validates :introduction,   presence:true

end
