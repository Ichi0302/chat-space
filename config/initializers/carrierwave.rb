require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-west-2'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'chat-space-image-uplaod'
        config.asset_host = 'https://s3.amazonaws.com/chat-space-image-uplaod'
    when 'production'
        config.fog_directory  = 'chat-space-image-uplaod'
        config.asset_host = 'https://s3.amazonaws.com/chat-space-image-uplaod'
    end
end