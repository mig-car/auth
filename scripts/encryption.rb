# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string

secret = "tacos"
encrypted_string = BCrypt::Password.create(secret)
puts encrypted_string

# 2. prepare encrypted string for testing
login_secret = "tacos"


# 3. test secret against prepared encrypted string
result = BCrypt::Password.new(encrypted_string) == login_secret
puts result