# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_qwkly_session',
  :secret      => 'c512aec71b5de9fc7e7af3deefb9729ac8254957cf96f27ba5740f220225c4c49135fc092b43c50ade0033e1b08f064fd87f1aea3b63792bc1a187036573a5d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
