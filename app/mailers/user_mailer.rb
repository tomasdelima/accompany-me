class UserMailer < ActionMailer::Base
  default from: "notifications@accompany-me.com"

  def welcome_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to 'Accompany-me'!")
  end

  def notify_next_friend_accompaniment(user, friend)
    @user = user
    @friend = friend
    mail(to: user.email, subject: "Reminder of next accompaniment")
  end

  def notify_next_activity_accompaniment(user, activity)
    @user = user
    @activity = activity
    mail(to: user.email, subject: "Reminder of next accompaniment")
  end
end
