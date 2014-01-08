class UserMailer < ActionMailer::Base
  default :from => "aayush.kothari10@gmail.com"  
  
  def registration_confirmation(user)  
  	@user=user
    mail(:to => user.email, :subject => "Registered")  
  end

  def post(micropost,student)
  @user=micropost.user
  @micropost=micropost 
    mail(:from => @user.email, :to => student.email, :subject => "New Post")  
  end
end
