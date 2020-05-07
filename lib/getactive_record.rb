
# category.joins(products:, [:likes, :reviews]).uniq
#
# 1
# post.joins(:comments).uniq
#
# 2
# user.joins(:posts).where('user.email = ?', 'test@gmail.com').uniq
#
# 3
# user.joins(:posts).where('posts.description = ?', 'Ruby is awesome').uniq
# 4
# user.joins(posts: [:comments]).uniq
#
# 5
# SELECT "posts"."*" FROM 'posts' INNER JOIN "comments" ON "comments"."post_id" = "posts"."id" WHERE comments.title = 'test'
#
# 6
# SELECT "posts"."id" FROM 'posts' LEFT OUTER JOIN "comments" ON "comments"."post_id" = "posts"."id" WHERE comments.title = 'test'
#
# 7
# SELECT "posts"."*" FROM 'posts' WHERE "posts"."user_id" IN (1, 2, 3) LEFT OUTER JOIN "comments" ON "comments"."post_id" = "posts"."id"
#
# 8
# SELECT "posts" FROM 'posts' WHERE 'posts'.'title' = 'TEST'

# Write a sidekiq worker to send mail to the almost 1000000 users who have signed up on the system today. Given mail(user_id) method which sends mail to the user synchronously.
# Make sure job execution time is minimal. In case of failure job must not send duplicate email to the user.


#
#
#
#
# class SendMails
#   include Sidekiq::Worker
#   sidekiq_options retry: 10, queue SendEmails
#
#   def perform(user_ids)
#     User.where(id: user_ids).find_in_batches do |batch|
#       if !User.emailed?
#         SystemMailer.perform_email(User.id)
#         update_emailed_flag     # Method to model to update e-mailed flag
#       end
#     end
#   end
# end




