class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def forget_password(user)
    @user = user
    @url = "http://www.google.com"
    @temp_password = (0...8).map{(65+rand(26)).chr}.join
    mail(:to => user.email, :subject => "Welcome to my Awesome Site")
  end
  
end
