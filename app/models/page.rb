class Page < ActiveRecord::Base
  acts_as_versioned

  def self.find_or_initialize_by_slug(slug)
    find_by_slug(slug) || initialize_by_slug(slug)
  end
  
  def self.initialize_by_slug(slug)
    new :name => slug.gsub(/_/,' ').capitalize, :slug => slug
  end
  
  def set_slug
    self.slug = name.to_slug
  end
  
  def to_param
    self.slug
  end
  
  def inbound_links
    Page.where('content like ?', "%#{slug}%").order('name asc')
  end
end
