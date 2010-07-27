# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wardiary2_session',
  :secret      => 'eeca7ccf4bcbca4f4b724e2e1f7c5037b5f83ebcfadaa5a29bf0754024695361aa8afcd462d4fe73a3d5860af85f32547bd45042174dd5aa70bf8efd8693e72b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
