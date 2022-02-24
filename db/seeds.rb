first_user = User.create(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
second_user = User.create(name: "Lilly", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Poland.")

first_post = Post.create(user_id: first_user.id, title: "Hello", text: "This is my first post")
second_post = Post.create(user_id: first_user.id, title: "Hello", text: "This is my second post")
third_post = Post.create(user_id: first_user.id, title: "Hello", text: "This is my third post")
forth_post = Post.create(user_id: first_user.id, title: "Hello", text: "This is my forth post")

Comment.create(post_id: first_post.id, user_id: second_user.id, text: "Hi Tom! 1")
Comment.create(post_id: first_post.id, user_id: first_user.id, text: "Hi Tom! 2")
Comment.create(post_id: first_post.id, user_id: first_user.id, text: "Hi Tom! 3")
Comment.create(post_id: first_post.id, user_id: second_user.id, text: "Hi Tom! 4")
Comment.create(post_id: first_post.id, user_id: first_user.id, text: "Hi Tom! 5")
Comment.create(post_id: first_post.id, user_id: second_user.id, text: "Hi Tom! 6")

Like.create(post_id: first_post.id, user_id: second_user.id)
Like.create(post_id: first_post.id, user_id: second_user.id)
Like.create(post_id: first_post.id, user_id: second_user.id)
