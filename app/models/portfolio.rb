class Portfolio < ActiveRecord::Base
  before_create :user_is_artist?
  attr_accessible :first_name, :last_name, :city, :state, :tattoo_shop, :bio, :twitter, :instagram, :flickr, :website


  private
    def user_is_artist?
      if current_user.is_artist == true
    end
  end
end
