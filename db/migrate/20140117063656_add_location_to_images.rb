class AddLocationToImages < ActiveRecord::Migration
  def change
    add_column :images, :location, :string
  end
end
