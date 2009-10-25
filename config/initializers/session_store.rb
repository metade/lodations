# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lodations_session',
  :secret      => 'c7a67575ab5d6969d0624b5ab0a6160d278eeb560d8342eaef289866f566955c6caa0b680fdde6067ff13787c1b208e2fe455075da65a457332e21df3fb8a6ce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
