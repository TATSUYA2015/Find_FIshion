class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  #itemでcontributor.idを探し当てる
  has_one :contributor, through: :item

  scope :with_active_contributor, -> {joins(:contributor).merge(Contributor.active)}

end
