class Blog::CommentMailer < ActionMailer::Base

  def notification(comment)
    subject   =  BlogComment::Notification.subject
    recipients = BlogComment::Notification.find_notification_recipient
    from     =   'fake@mcmsdevolper.com'
    sent_on   =  Time.now
    @comment =  comment.body
    mail(:subject => subject, :from => from, :body => @comment, :to => recipients)
  end

end
