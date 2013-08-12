class AddSlugToPages < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string
    
    Page.all.each do |p|
      p.set_slug
      p.save!
    end
  end
end
