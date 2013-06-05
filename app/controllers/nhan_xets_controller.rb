#encoding: utf-8
class NhanXetsController < ApplicationController
  # GET /nhan_xets
  # GET /nhan_xets.json
  def index
    @nhan_xets = NhanXet.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nhan_xets }
    end
  end

  # GET /nhan_xets/1
  # GET /nhan_xets/1.json
  def show
    @nhan_xet = NhanXet.where(:chi_tiet_binh_bau_id => params[:id])

    respond_to do |format|
      format.json { render json: @nhan_xet.collect{|i| {:NoiDung => i.NoiDung, :created_at =>i.created_at.strftime("Ngày %d/%m/%Y lúc %H:%M"), :MaUser => i.user.MaUser,:TenUser => i.user.HoTen, :TenTruong => i.truong.TenTruong}} }
    end
  end

  # GET /nhan_xets/new
  # GET /nhan_xets/new.json
  def new
    @nhan_xet = NhanXet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nhan_xet }
    end
  end

  # GET /nhan_xets/1/edit
  def edit
    @nhan_xet = NhanXet.find(params[:id])
  end

  # POST /nhan_xets
  # POST /nhan_xets.json
  def create
    @nhan_xet = NhanXet.new(params[:nhan_xet])
    @nhan_xet[:user_id] = session[:FBUser][:id]
    respond_to do |format|
      if @nhan_xet.save
        format.html { render json: {:NoiDung => @nhan_xet.NoiDung, :created_at =>@nhan_xet.created_at.strftime("Ngày %d/%m/%Y lúc %H:%M"), :MaUser => @nhan_xet.user.MaUser,:TenUser => @nhan_xet.user.HoTen, :TenTruong => @nhan_xet.truong.TenTruong}}
      end
    end
  end

  # PUT /nhan_xets/1
  # PUT /nhan_xets/1.json
  def update
    @nhan_xet = NhanXet.find(params[:id])

    respond_to do |format|
      if @nhan_xet.update_attributes(params[:nhan_xet])
        format.html { redirect_to [:admin, @nhan_xet], notice: 'Nhan xet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nhan_xet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nhan_xets/1
  # DELETE /nhan_xets/1.json
  def destroy
    @nhan_xet = NhanXet.find(params[:id])
    @nhan_xet.destroy

    respond_to do |format|
      format.html { redirect_to admin_nhan_xets_url }
      format.json { head :no_content }
    end
  end
end
