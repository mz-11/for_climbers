# S3への保存設定のためcarrierwave.rbファイルを作成
# fogが使用するアップロード先の情報を設定

unless Rails.env.development? || Rails.env.test? #なんの条件分岐 envとは
  CarrierWave.configure do |config| #configureとは
    config.fog_credentials = {
      provider: 'AWS',
      # 機密情報漏えいを防ぐために.bash_profileにid等の情報について環境変数設定を行った
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
      # ローカル環境とherokuそれぞれに設定する必要がある(heroku config:set)
    }
    config.fog_directory  = 'rails-forclimbers-photo'
    config.cache_storage = :fog
  end
end