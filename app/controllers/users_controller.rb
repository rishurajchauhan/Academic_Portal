class UsersController < ApplicationController
   before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers]
   before_filter :correct_user,   only: [:edit, :update]
    before_filter :admin_user,     only: :destroy

 def new
  @user= User.new
  if signed_in? and !current_user.admin
    redirect_to current_user
  end
  end
  def edit
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  def index
    @users = User.paginate(page: params[:page])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def show
    @arr = Array.new
    @user = User.find(params[:id])
    #@user.img=markdown("<img src="+@user.img+" />")
    if @user.designation=="student"
      render 'student'
    elsif @user.designation=="class"
      render 'class'
    else 
     @microposts = @user.microposts.paginate(page: params[:page])

      @profile=@user.profile
      @text=@profile.research.split(/\r?\n/)
      @text=@text.delete_if{|x| x==''}
      @books=[]
      for j in 0..((@text.length/2)-1)
        @books[j]=@text.slice!(0..1)
      end
      @books1=[]
      for j in @books
        j[0]="<br /><b style='color: black'>Field: </b> "+j[0]+"<br />"
        j[1]="<b style='color: black'>Link: </b> "+j[1]+"<br />"
        @books1.push(j.flatten)
      end
      @profile.research=@books1.join

    @text=@profile.collaborators.split(/\r?\n/)
    @text=@text.delete_if{|x| x==''}
    @collabs=[]
    for i in 0..((@text.length/2)-1)
      @collabs[i]=@text.slice!(0..1)
    end
    @collabs1=[]
    for c in @collabs
      c[0]="<h5><u>"+c[0]+"</u></h5>"
      c[1]="<h6>-"+c[1]+"</h6><br />"
      @collabs1.push(c.flatten)
    end
    @profile.collaborators=@collabs1.join

    
    @text=@profile.subjects.split(/\r?\n/)
    for i in 0..@text.length-1
      @class=@text[i].split(',')[1]
      @text[i]=@text[i].split(',')[0]
      @text[i]="<br />"+"<li style='color:#000; font-size: 15px'>"+@text[i]+": "+@class+"</li>"+"<br />"
    end
    @profile.subjects="<ul>"+@text.join+"</ul>"
  
    @text=@profile.current_students.split(/\r?\n/)
    for i in 0..@text.length-1
      @text[i]="<br />"+"<li>"+@text[i]+"</li>"+"<br />"
    end
    @profile.current_students="<ul>"+@text.join+"</ul>" 
    
    @text=@profile.conferences.split(/\r?\n/)
   @text=@text.delete_if{|x| x==''}  
    @journals=[]
    for j in 0..((@text.length/6)-1)
      @journals[j]=@text.slice!(0..5)
    end
    @journals1=[]
    for j in @journals
    j[0]="<br /><h5 style='color:blue'><u>"+j[0]+"</u></h5>"
    j[1]="<span style='color: #000'>"+j[1]+"</span><br /><br />"
    j[2]="<h3>"+j[2]+"</h3>"
    j[3]="<span style='color: #000'>"+j[3]+"</span><br /><br />"
    j[4]="Month/Year: "+"<span style='color: #000'>"+j[4]+"</span><br /><br />"
    j[5]="Page(s): "+"<span style='color: #000'>"+j[5]+"</span><br /><br /><hr />"
    @journals1.push(j.flatten)
    
    end
    @profile.conferences=@journals1.join

    @text=@profile.journals.split(/\r?\n/)
    @text=@text.delete_if{|x| x==''}  
    @journals=[]
    for j in 0..((@text.length/5)-1)
      @journals[j]=@text.slice!(0..4)
    end
    @journals1=[]
    for j in @journals
    j[0]="<h5 style='color:blue'><u>"+j[0]+"</u></h5>"
    j[1]="<span style='color: blue; font-size: 12px'>"+j[1]+"</span><br /><br />"
    j[2]="Volume,Issue: "+"<span style='color: black'>"+j[2]+"</span><br /><br />"
    j[3]="Publication Year: "+"<span style='color: black'>"+j[3]+"</span><br /><br />"
    j[4]="Page(s): "+"<span style='color: black'>"+j[4]+"</span><br /><hr />"
    @journals1.push(j.flatten)
    end
    
    @profile.journals=@journals1.join
  
    @text=@profile.books.split(/\r?\n/)
    @text=@text.delete_if{|x| x==''}
    @books=[]
    for j in 0..((@text.length/6)-1)
      @books[j]=@text.slice!(0..5)
    end
    @books1=[]
    for j in @books
    j[0]="<br /><h3><u>"+j[0]+"</u></h3>"
    j[1]="<span style='color: #D9D8BA'>"+j[1]+"</span><br /><br />"
    j[2]="<u>Publisher</u>: "+"<span style='color: #D9D8BA'>"+j[2]+"</span><br /><br />"
    j[3]="<u>Edition</u>: "+"<span style='color: #D9D8BA'>"+j[3]+"</span><br /><br />"
    j[4]="<u>Year</u>: "+"<span style='color: #D9D8BA'>"+j[4]+"</span><br /><br />"
    j[5]="<span style='color: #D9D8BA'>"+j[5]+"</span><br /><br /><hr />"
    @books1.push(j.flatten)
    end
    @profile.books=@books1.join

    @text=@profile.monogram.split(/\r?\n/)
    @text=@text.delete_if{|x| x==''}
    @monograms=[]
    for j in 0..((@text.length/4)-1)
      @monograms[j]=@text.slice!(0..3)
    end
    @monograms1=[]
    for j in @monograms
    j[0]="<br /><h3><u>"+j[0]+"</u></h3>"
    j[1]="<span style='color: #D9D8BA'>"+j[1]+"</span><br /><br />"
    j[2]="<u>Publisher</u>: "+"<span style='color: #D9D8BA'>"+j[2]+"</span><br /><br />"
    j[3]="<u>Year</u>: "+"<span style='color: #D9D8BA'>"+j[3]+"</span><br /><br /><hr />"
    @monograms1.push(j.flatten)
    end
    @profile.monogram=@monograms1.join
    
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      if @user.designation=="teacher" 
        if @user.uid=="mumit@123"
            #UserMailer.registration_confirmation(@user).deliver
            redirect_to new_profile_path
            sign_in @user
            return
        else 
          @user.destroy
          redirect_to new_user_path
          flash[:error] = "Incorrect Unique Id"
          return 
        end
    elsif @user.designation=="class"
          redirect_to :back
          return
    else
      #UserMailer.registration_confirmation(@user).deliver
      sign_in @user
    end
    flash[:success] = "Welcome, #{@user.name}"
     redirect_to @user
     
    else
      render 'new'
    end
  end
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
