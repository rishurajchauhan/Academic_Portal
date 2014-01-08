class MicropostsController < ApplicationController
 before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    #@comment=@micropost.comments.new
    #@comment.micropost_id=@micropost.id
    if @micropost.save
      @class=User.find_by_id(@micropost.group_id)
      if @class.followers.any?
      for usr in @class.followers.all.each do
        if usr.designation=="student"
          #UserMailer.post(@micropost,usr).deliver
        end
      end
    end
      flash[:success] = "Post created!"
      redirect_to :back
    else
     @feed_items = []
      render 'static_pages/home'
    end
  end
  def destroy
     @micropost.destroy
      
      redirect_to :back
  end
  
  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end