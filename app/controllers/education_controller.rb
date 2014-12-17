class EducationController < ApplicationController
	def index
		@educations = Array.new
		auths = session['fb_auth']
		@education = auths["extra"]["raw_info"]["education"]
		@education.each do |education|
        @educations << Education.from_history(education)
      end
              
         user = User.find(session[:user_id])
         user.educations = @educations
      
         #@usersfromc = Array.new
         session_uid = session[:user_id]
         @education_id = 5
         @name = Array.new
         user_education = Education.find(@education_id)
         @education_name = user_education.name
         user_education.users.each do |usr|
         	if usr.id != session_uid
            @name << usr.name 
            end
         end
    end
end
