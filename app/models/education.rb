class Education < ActiveRecord::Base
  attr_accessible :school_id, :name
  has_and_belongs_to_many :users
  has_one :about

   def self.from_history(education)
   	find_by_name_and_school_id(education.school.name, education.school.id) || create_school(education)
   end

   def self.create_school(education)
   	education = Education.new(:name => education.school.name, :school_id => education.school.id )
      education.save
      education
   end
end
