class User < ActiveRecord::Base
  #attr_accessible  :name, :provider, :email, :uid, :location, :birthday 

   # validates_uniqueness_of :uid, :scope => :provider

  has_many :posts
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :educations
  has_and_belongs_to_many :favourites


  def self.from_omniauth(auth)
    find_by_provider_and_uid_and_location_and_relationship_status(auth["provider"], auth["uid"], auth["info"]["location"], auth["extra"]["raw_info"]["relationship_status"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.gender = auth["extra"]["raw_info"]["gender"]
      user.hometown = auth["extra"]["raw_info"]["hometown"]["name"]
      user.email = auth["info"]["email"]
      user.location = auth["info"]["location"]
      user.birthday = auth["extra"]["raw_info"]["birthday"]
      user.interested_in = auth["extra"]["raw_info"]["interested_in"]
      user.language = auth["extra"]["raw_info"]["languages"].collect{|obj| obj.name}.join(",")
      user.relationship_status = auth["extra"]["raw_info"]["relationship_status"]
      user.religion = auth["extra"]["raw_info"]["religion"]
      #user.sports = auth["extra"]["raw_info"]["sports"].collect{|obj| obj.name}.join(",")
      user.work = auth["extra"]["raw_info"]["work"].collect{|obj| obj.employer.name}.join(",")

    end
  end

   #ThinkingSphinx::Index.define :User, :with => :active_record do
     # fields
    #define_index do 
     #indexes loaction
     #indexes :name

     # attributes
     #has created_at, updated_at
   #end

end
