class TieuChisController < ApplicationController
  # GET /tieu_chis
  # GET /tieu_chis.json
  def index
    @tieu_chis = TieuChi.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tieu_chis }
    end
  end

  # GET /tieu_chis/1
  # GET /tieu_chis/1.json
  def show
    @tieu_chi = TieuChi.find(params[:id])
    @truongs=Truong.all
    @map=showmap(@truongs)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tieu_chi }
    end
  end

  # GET /tieu_chis/new
  # GET /tieu_chis/new.json
  def new
    @tieu_chi = TieuChi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tieu_chi }
    end
  end

  # GET /tieu_chis/1/edit
  def edit
    @tieu_chi = TieuChi.find(params[:id])
  end

  # POST /tieu_chis
  # POST /tieu_chis.json
  def create
    @tieu_chi = TieuChi.new(params[:tieu_chi])

    respond_to do |format|
      if @tieu_chi.save
        format.html { redirect_to admin_tieu_chis_url, notice: 'Tieu chi was successfully created.' }
        format.json { render json: @tieu_chi, status: :created, location: @tieu_chi }
      else
        format.html { render action: "new" }
        format.json { render json: @tieu_chi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tieu_chis/1
  # PUT /tieu_chis/1.json
  def update
    @tieu_chi = TieuChi.find(params[:id])

    respond_to do |format|
      if @tieu_chi.update_attributes(params[:tieu_chi])
        format.html { redirect_to admin_tieu_chis_url, notice: 'Tieu chi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tieu_chi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tieu_chis/1
  # DELETE /tieu_chis/1.json
  def destroy
    @tieu_chi = TieuChi.find(params[:id])
    @tieu_chi.destroy

    respond_to do |format|
      format.html { redirect_to admin_tieu_chis_url }
      format.json { head :no_content }
    end
  end
end
