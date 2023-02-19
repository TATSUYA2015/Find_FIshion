class Item < ApplicationRecord

    has_one_attached :image

    belongs_to :contributor
    has_many :comments,    dependent: :destroy
    belongs_to :genre, optional: true
    has_many :favorites,   dependent: :destroy


    def favorited_by?(customer)
        favorites.exists?(customer_id: customer.id)
    end

    # 検索方法分岐
    def self.looks(search, word)
        if search=="perfect_match"
            @item=Item.where("name LIKE?","#{word}")
        elsif search=="forward_match"
            @item=Item.where("name LIKE?","#{word}%")
        elsif search=="backward_match"
            @item=Item.where("name LIKE?","%#{word}")
        elsif search=="partial_match"
            @Item=Item.where("name LIKE?","%#{word}%")
        else
            @item=Item.all
    end
  end


    validates :name,           presence:true
    validates :image,          presence:true
    validates :genre,          presence:true
    validates :introduction,   presence:true

end
