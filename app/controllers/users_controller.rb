#encoding: utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    logout = params[:logout]
    if logout=="true"
      session[:FBUser] = nil
      redirect_to "/", notice: "<font color='green'>Tài khoản đã đăng xuất thành công!!!"
      return
    end

    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if @user.Active == true
      @user.Active = false
    else
      @user.Active = true
    end
    @user.save
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @check= User.where('MaUser= ?',@user[:MaUser]).first
    if !@check.nil?
      if !@check[:Active]
        redirect_to '/', notice: "Tài khoản đã bị khóa!!!"
        return
      else
        @check[:HoTen] = @user[:HoTen]
        @check.save
      end  
    end

    session[:FBUser] = {:MaUser => @user[:MaUser], :Name => @user[:HoTen], :Image => params[:Image], :id=> nil}

    respond_to do |format|
      if @user.save
        session[:FBUser][:id]=@user[:id]
        format.html { redirect_to :back }
        format.json { render json: @user, status: :created, location: @user }
      else
        session[:FBUser][:id]=@check[:id]
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to  admin_users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end
