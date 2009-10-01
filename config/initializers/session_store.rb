# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chat.git_session',
  :secret      => 'aaadba223f612c84bf7dea0ffec6eb8ac6f090c40af99219d9ccda9180d134f8072a9592d01a9fdeb35098e840f97080cc7f0bbe8f0aabc77183b773ac4735ad'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
