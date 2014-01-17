class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.string :command

      t.timestamps
    end
  end
end
