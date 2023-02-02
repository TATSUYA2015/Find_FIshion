class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
           # Twitter API認証用に追加
         :omniauthable, omniauth_providers: [:twitter, :google_oauth2]


  # Twitter,google認証ログイン用
  # ユーザーの情報があれば探し、無ければ作成する
  def self.find_for_oauth(auth)
    #↓これでどの情報がTwitterから飛んできてるかターミナルに表示される。
    #pp auth
    customer = Customer.find_by(uid: auth.uid, provider: auth.provider)
    name = "ネームを登録してね！！" if auth[:info][:name] == nil
    customer ||= Customer.create!(
      uid: auth.uid,
      provider: auth.provider,
      name: name,
      # first_name: name,
      #E-mailはTwitterログインでは取得できない
      email: Customer.dummy_email(auth),
      password: Devise.friendly_token[0, 20],
      # last_name: "@",
      # last_name_kana: "ツイッター",
      # first_name_kana: "ツイッター",
      account: "twitter",
      telephone_number:"000-0000-0000"
    )
    customer
  end
  # ダミーのメールアドレスを作成
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end

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

  #画像処理
  has_one_attached :profile_image
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name,                 presence: true
  validates :account,              presence: true
  validates :telephone_number,     presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
end