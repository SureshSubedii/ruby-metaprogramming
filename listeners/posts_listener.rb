class PostsListener
  include Notifications

  listens_to :commented
end
