class UsersListener
  include Notifications

  listens_to :signed_up
  listens_to :email_changed
end
