class SearchController < ApplicationController

#   def search
#     @search = Sunspot.search(Tattoo, User, Artist) do |query|
#       query.keywords params[:q] 
#       query.paginate(:page => params[:page], :per_page => params[:per_page])
#     end
#   end


  def search
    @search = Sunspot.search(Tattoo, User, Artist) do
      keywords params[:q] do
        minimum_match 1
      end
      paginate :page => params[:page], :per_page => params[:per_page]
    end
  end
end
end