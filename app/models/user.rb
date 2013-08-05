class User < ActiveRecord::Base
  acts_as_voter
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :location, :is_artist
  # Establish relationships between models
  has_many :tattoos
  has_many :comments
  #has_one :portfolio

  scope :artists, -> { where(is_artist: true) }

  # # Favorite artist setter
  # def favorite_artist=(artist_name)
  #   if favorite_artist_in_system = User.find_by_name(artist_name)
  #     self.favorite_artist_user = favorite_artist_in_system
  #   else
  #     self.favorite_artist_name = artist_name
  #   end
  # end

  # # Favorite artist getter
  # def favorite_artist
  #   if favorite_artist_name.blank?
  #     self.favorite_artist_user # <- favorite_artist_user_id column in database
  #   else
  #     favorite_artist_name # <- new column in the database
  #   end
  # end

  # first_name last_name searchable_name  <- ActiveRecord observers

  # def update_searchable_name
  # end




  def self.search_artists(artist_name)
    artists.where("searchable_name LIKE ?", "%#{artist_name.gsub(' ', '%')}%")
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider,:uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
    end
  end 

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection:true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end 
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
