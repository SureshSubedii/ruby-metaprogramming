# START

Inside `wfi task` task directory run ruby console with: `irb`.
All classes and modules should be loaded by ruby console as it's defined in `.irbrc` file.

Make sure you have `yaml`, `pry` gems installed, if not install these gems:

```
gem install yaml
gem install pry
```

# ASSIGNMENT

Implement `Notifications` module which is included to `listeners`  classes by finishing `listens_to` class method.
`listens_to` method must dynamically define instance method depending on event name and in what class `Notification` module was included.

Examples:

For `PostsListener` and `listens_to :commented` it must define `on_posts_commented` method.
For `UsersListener` and `listens_to :signed_up` it must define `on_users_signed_up` method and so on...

These instance methods must return notification content with exchanged data spots `%{{{}}}` for real data. (take a look inside `notifications_config.yml`)
 `notifications_config.yml`  contains content schema for notifications. It's loaded to `CONFIG` constant in `Notifications` module.


Do not modify any other file than `notifications.rb`.
Use metaprogramming.


# EXPECTED BEHAVIOUR


```

posts_data = { user: { name: 'John Doe' }, post: { title: 'Metaprogramming Technique' } }
posts_listener = PostsListener.new

posts_listener.on_posts_commented(posts_data)
```

=> "User John Doe added comment to your post Metaprogramming Technique."

```
users_data = { user: { name: 'John Doe', email: 'user@example.com' } }
users_listener = UsersListener.new

users_listener.on_users_signed_up(users_data)
```
=>  "Hi John Doe. Welcome onboard!"

```
users_listener.on_users_email_changed(users_data)
```
=> "Your email has been changed to user@example.com."
