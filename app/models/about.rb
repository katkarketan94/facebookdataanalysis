class About < ActiveRecord::Base
  attr_accessible :author, :directed_by, :genre, :page_id, :starring, :website, :category, :description, :name, :about

  def self.from_history(page)
   	find_by_page_id(page["id"]) || create_about(page)
   end

   def self.create_about(page)
   	page = About.new(:directed_by => page["directed_by"], :starring => page["starring"], :genre => page["genre"], :page_id => page["id"], :about => page["about"], :name => page["name"], :description => page["description"], :category => page["category"])
    page.save
    page
    end
end
