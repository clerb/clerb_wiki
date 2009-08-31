# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clerb_wiki_session',
  :secret      => 'f0139a6b546fdc962e75fcd5ba27298e0b97e938e0c2a61c5bcd198208f9176fb1b082f4d40ace6f082fbfd357a42e8af99876c5e5dcff2e6088276df7392601'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
