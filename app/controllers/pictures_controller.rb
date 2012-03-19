class PicturesController < ApplicationController
  
  before_filter :check_email, :only => [:create, :update]
  before_filter :get_user, :only => [:create, :update]
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    if @email_valid
      @picture = Picture.new(params[:picture])
      respond_to do |format|
	if @picture.save
	  format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
	  format.json { render json: @picture, status: :created, location: @picture }
	else
	  format.html { render action: "new" }
	  format.json { render json: @picture.errors, status: :unprocessable_entity }
	end
      end

    else
      redirect_to(pictures_path, :notice => "Sorry, the email address is wrong")
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    if @email_valid
      @picture = Picture.find(params[:id])

      respond_to do |format|
	if @picture.update_attributes(params[:picture])
	  format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
	  format.json { head :no_content }
	else
	  format.html { render action: "edit" }
	  format.json { render json: @picture.errors, status: :unprocessable_entity }
	end
      end

    else
      redirect_to(pictures_path, :notice => "Sorry, the email address is wrong")
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
  
  # Check if email of user is valid
  def check_email
    @email_valid = (params[:picture][:user] =~ /^([a-zA-Z0-9_-])+([.]?[a-zA-Z0-9_-]{1,})*@([a-zA-Z0-9-_]{2,}[.])+[a-zA-Z]{2,3}$/i)
  end
  
  # Set the params[:picture][:user] at user
  def get_user
    user = User.where(:email => params[:picture][:user])
    if @email_valid
      user = user.first_or_create(:email => params[:picture][:user])
      params[:picture][:user] = user
    end
  end
end
