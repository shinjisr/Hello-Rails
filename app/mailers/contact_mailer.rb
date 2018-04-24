class ContactMailer < ApplicationMailer # '<' means inherit
  # 說起來 mailer 類似 controller 的功能，action 寫起來如下：
  def say_hello_to(user)
    # assign @user as user
    @user = user
    # 寄信的方法是以下這行
    mail to:@user.email, subject:"你好！"
    # 信件內容類似 view
  end
end
