# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_db:migrate_session',
  :secret      => 'f435173a353780b775851dd035c6b4aa654d0a8040def14111110a48e7a280717f52bd184266799295475b3a98e61a439d76e92cae0e3939d7b77a3ed1e43f08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
