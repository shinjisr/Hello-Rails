class UserConfirmEmailJob < ApplicationJob
  queue_as :default # or :low_priority :urgent

  def perform(user)
    # Do something later
    # sent confirm email
    mail to:@user.email, subject:"你好！"
  end
end
