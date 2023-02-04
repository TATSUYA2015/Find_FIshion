class Contributor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #↓ contributreの会員が有効な人だけ取得している
  scope :active, -> { where(is_deleted: false) }
  # scope :deleted, -> { where(is_deleted: true) }

  #退会しているかの判断
  def activ_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many :items, dependent: :destroy
  def items
    Item.where(contributor_id: self.id)
  end

  #検索機能　検測分岐
  def self.looks(search, word)
    if search=="perfect_match"
      @contributor=Contributor.where("brand_name LIKE?", "#{word}")
    elsif search=="forward_match"
      @contributor=Contributor.where("brand_name LIKE?","#{word}%")
    elsif search=="backward_match"
      @contributor=Contributor.where("brand_name LIKE?","%#{word}")
    elsif search=="partial_match"
      @contributor=Contributor.where("brand_name LIKE?","%#{word}%")
    else
      @contributor=Contributor.all
    end
  end

  #フォロー機能アソシエーション
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :relationships, source: :following, dependent: :destroy

  has_one_attached :profile_image
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :last_name,            presence: true, length: { minimum: 1}
  validates :first_name,           presence: true, length: { minimum: 1}
  validates :last_name_kana,       presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana,      presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :brand_name,           presence: true
  validates :postal_code,          presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :address,              presence: true, length: { minimum: 1}
  validates :telephone_number,     presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
  validates :introduction,         presence: true, length: { maximum: 100 }, on: :update


end
