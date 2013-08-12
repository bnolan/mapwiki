class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :phone, :website, :address
      t.text :content
      t.float :latitude, :longitude
      t.timestamps
    end
    
    Page.create_versioned_table
  end
end
