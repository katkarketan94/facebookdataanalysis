class Page < ActiveRecord::Base
  attr_accessible :name ,:category, :uid
  has_and_belongs_to_many :users
  has_one :about

   def self.from_history(pages)
   	find_by_name_and_category(pages["name"], pages["category"]) || create_page(pages)
   end

   def self.create_page(pages)
   	page = Page.new(:name => pages["name"],:category => pages["category"])
      page.save
      page
   end
end

