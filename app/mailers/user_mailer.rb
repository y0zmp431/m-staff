class UserMailer < ActionMailer::Base
  default from: "system@vashvybor.by"

 def recovery_password(user, new_passwd)
    @user = user
    @new_passwd = new_passwd 
    @url  = "http://vashvybor.by"
    mail(:to => user.email, :subject => t("Recovery password"))
  end
end
