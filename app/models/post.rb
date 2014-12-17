class Post < ActiveRecord::Base
  attr_accessible :name, :heading, :content, :uid
  belongs_to :user

end
