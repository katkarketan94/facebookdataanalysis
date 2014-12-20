OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'APP_ID', 'SECRET_APP_ID',
     :scope => 'email,user_birthday,read_stream,user_friends,user_about_me,user_actions.books,user_interests,user_birthday,user_website,user_activities,user_hometown,user_likes,user_work_history,user_location,read_friendlists,user_events,user_groups,user_status,user_relationships,user_relationship_details,user_actions.music,user_tagged_places,user_actions.news,user_actions.fitness,user_education_history,user_games_activity,user_religion_politics', :display => 'popup'
end
