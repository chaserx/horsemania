# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_horsemania_session',
  :secret      => '602385a3f633a77bfcbdf143bfe674866988a4e517841655308f415557c3596dbcf4b11ee32e701a6c8d62602e3becc3173ad5cb374f089866892f8e8f9c14f7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
