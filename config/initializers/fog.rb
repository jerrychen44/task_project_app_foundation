#[Jerry] add for production to AWS, the same with photo-app

CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']

  #[Jerry] change bucket Region to US Standard, then work!
  # so , far need to the same with heroku sever , but don't know why
  #:region => ENV['S3_REGION']
  }

  config.fog_directory = ENV['AWS_BUCKET']
  config.fog_public = false

end
