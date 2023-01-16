class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #コメント機能アソシエーション
  has_many :comments,      dependent: :destroy
  #お気に入り機能アソシエーション
  has_many :favorites,     dependent: :destroy

  #フォロー機能アソシエーション
  has_many :relationships, foreign_key: :following_id, dependent: :destroy
  has_many :followings,through: :relationships, source: :follower

  #フォローしているか判断する
  def following?(contributor)
    followings.include?(contributor)
  end

  #退会の有無の判断
  def activ_for_authentication?
    super && (self.is_deleted == false)
  end


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
  validates :account,              presence: true
  validates :postal_code,          presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :address,              presence: true, length: { minimum: 1}
  validates :telephone_number,     presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}

end