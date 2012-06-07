require 'aws/s3'

AWS::S3::Base.establish_connection!(
  :access_key_id     => $s3_access_key_id,
  :secret_access_key => $s3_secret_access_key
)