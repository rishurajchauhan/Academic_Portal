class ProfilesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  # GET /profiles
  # GET /profiles.json
  def markdown(content)

  markdown =Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:hard_wrap=>true,:filter_html=>true,:autolink=>true,:no_intra_emphasis=>true)
  markdown.render(content).html_safe

end
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:user_id])
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id

    if @profile.save

         redirect_to current_user, notice: 'Profile was successfully created.' 
    else 
      render 'new'
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])

        format.html { redirect_to user_path(current_user), notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
