class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :introduction, presence: true,length:{maximum:140}

end
