#encoding: utf-8
class NhanXetTqsController < ApplicationController
  # GET /nhan_xet_tqs
  # GET /nhan_xet_tqs.json
  def index
    @nhan_xet_tqs = NhanXetTq.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nhan_xet_tqs }
    end
  end

  # GET /nhan_xet_tqs/1
  # GET /nhan_xet_tqs/1.json
  def show
    @nhan_xet_tq = NhanXetTq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nhan_xet_tq }
    end
  end

  # GET /nhan_xet_tqs/new
  # GET /nhan_xet_tqs/new.json
  def new
    @nhan_xet_tq = NhanXetTq.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nhan_xet_tq }
    end
  end

  # GET /nhan_xet_tqs/1/edit
  def edit
    @nhan_xet_tq = NhanXetTq.find(params[:id])
  end

  # POST /nhan_xet_tqs
  # POST /nhan_xet_tqs.json
  def create
    @nhan_xet_tq = NhanXetTq.new(params[:nhan_xet_tq])
    @nhan_xet_tq[:user_id] = session[:FBUser][:id]
    respond_to do |format|
      if @nhan_xet_tq.save
        format.html { render json: {:NoiDung => @nhan_xet_tq.NoiDung, :created_at =>@nhan_xet_tq.created_at.strftime("Ngày %d/%m/%Y lúc %H:%M"), :MaUser => @nhan_xet_tq.user.MaUser,:TenUser => @nhan_xet_tq.user.HoTen} }
      end
    end
  end

  # PUT /nhan_xet_tqs/1
  # PUT /nhan_xet_tqs/1.json
  def update
    @nhan_xet_tq = NhanXetTq.find(params[:id])

    respond_to do |format|
      if @nhan_xet_tq.update_attributes(params[:nhan_xet_tq])
        format.html { redirect_to [:admin, @nhan_xet_tq], notice: 'Nhan xet tq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nhan_xet_tq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nhan_xet_tqs/1
  # DELETE /nhan_xet_tqs/1.json
  def destroy
    @nhan_xet_tq = NhanXetTq.find(params[:id])
    @nhan_xet_tq.destroy

    respond_to do |format|
      format.html { redirect_to admin_nhan_xet_tqs_url }
      format.json { head :no_content }
    end
  end
end
