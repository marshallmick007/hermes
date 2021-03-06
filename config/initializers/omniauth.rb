Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], access_type: "", scope: "userinfo.email,userinfo.profile,https://www.google.com/m8/feeds"
  on_failure do |env, msg|
    [200, {}, [env["omniauth.error"].inspect + ' ' + msg.to_s]] 
  end
end