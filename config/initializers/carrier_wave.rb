if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIF6EDFEXGC4WIEUQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['dashowes2']
  end
end