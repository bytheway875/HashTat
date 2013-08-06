class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :tattoo_shop 
      t.text   :bio
      t.string :twitter
      t.string :instagram
      t.string :flikr
      t.string :website
      t.references :user
      t.timestamps
    end
  end
end
