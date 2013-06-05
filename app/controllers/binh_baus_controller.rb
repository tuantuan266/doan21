#encoding: utf-8
class BinhBausController < ApplicationController
  # GET /binh_baus
  # GET /binh_baus.json
  def index
#THUẬT TOÁN ZOOM MAP
    @truongs = Truong.all
    @map=showmap(@truongs)

    if params[:end] == "true"
      @binh_baus = BinhBau.paginate(:per_page => 5, :page => params[:page]).where("Active = ? or NgayKetThuc < ?",false, DateTime.now.to_date).order('NgayBatDau DESC')
    else
      @binh_baus = BinhBau.paginate(:per_page => 5, :page => params[:page]).where("Active = ? and NgayBatDau <= ? and NgayKetThuc >= ?",true, DateTime.now.to_date, DateTime.now.to_date).order('NgayBatDau DESC')
    end
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @binh_baus }
    end
  end

  # GET /binh_baus/1
  # GET /binh_baus/1.json
  def show
    @binh_bau = BinhBau.find(params[:id])
    if params[:reload]!='true'
      @binh_bau[:LuotXem]+=1
      @binh_bau.save
    end
    @truongs = []
    @binh_bau.chi_tiet_binh_baus.each{ |ctbb| ctbb.chi_tiet_truongs.each{|cttrg| @truongs.push(cttrg.truong)}}
    @truongs = @truongs.uniq()

    #THUẬT TOÁN ZOOM MAP
    @map=showmap(@truongs)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @binh_bau }
    end
  end

  # GET /binh_baus/new
  # GET /binh_baus/new.json
  def new
    @binh_bau = BinhBau.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @binh_bau }
    end
  end

  # GET /binh_baus/1/edit
  def edit
    @binh_bau = BinhBau.find(params[:id])
    if @binh_bau.Active == true
      @binh_bau.Active = false
    else
      @binh_bau.Active = true
    end
    @binh_bau.save
    respond_to do |format|
      format.html { redirect_to admin_binh_baus_url }
      format.json { head :no_content }
    end
  end

  # POST /binh_baus
  # POST /binh_baus.json
  def create
   @binh_bau = BinhBau.new(params[:binh_bau])
    @flag = 0
    if params[:tieuchis] == nil
          @binh_bau.errors.add("Tieuchis", "Chưa chọn tiêu chí")
          @flag = 1
    else
      params[:tieuchis].each do |tieuchi|
          par = tieuchi.to_s + "-truongs"
          if params[par.to_s] == nil
              @binh_bau.errors.add("Truongs","Có tiêu chí chưa chọn trường")
              @flag = 1
              break
          end
      end
    end
    if @binh_bau.NgayKetThuc < DateTime.now
        @binh_bau.errors.add(:NgayKetThuc," nhỏ hơn ngày hiện tại")
        @flag = 1
    end
    if @binh_bau.NgayBatDau < DateTime.now
        @binh_bau.errors.add(:NgayBatDau," nhỏ hơn ngày hiện tại")
        @flag = 1
    end
    if @binh_bau.NgayKetThuc < @binh_bau.NgayBatDau
        @binh_bau.errors.add(:NgayKetThuc," bé hơn NgayBatDau")
        @flag = 1
    end
    respond_to do |format|
      if @flag == 0 && @binh_bau.save
        @dstruong = []
        params[:tieuchis].each do |tieuchi|
            @chitiet = ChiTietBinhBau.new(:binh_bau_id => @binh_bau.id, :tieu_chi_id => tieuchi)
              @tieu_chi = TieuChi.find(tieuchi)
              @tieu_chi.SoLuongBinhBau += 1
              @tieu_chi.save
            @chitiet.save

            par = tieuchi.to_s + "-truongs"
            params[par.to_s].each do |truong|
                @chitiettruong = ChiTietTruong.new(:chi_tiet_binh_bau_id => @chitiet.id, :truong_id => truong)
                @dstruong.push(truong)
                @chitiettruong.save
            end
        end
        Truong.find(@dstruong).uniq.each do |truong|
            truong.SoLuongBinhBau += 1
            truong.save
        end
        format.html { redirect_to  admin_binh_baus_url, notice: 'Binh bau was successfully created.' }
        format.json { render json: @binh_bau, status: :created, location: @binh_bau }
      else
        format.html { render action: "new" }
        format.json { render json: @binh_bau.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /binh_baus/1
  # PUT /binh_baus/1.json
  def update
    @binh_bau = BinhBau.find(params[:id])
    respond_to do |format|
      if @binh_bau.update_attributes(params[:binh_bau])
        format.html { redirect_to @binh_bau, notice: 'Binh bau was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @binh_bau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /binh_baus/1
  # DELETE /binh_baus/1.json
  def destroy
    @binh_bau = BinhBau.find(params[:id])
    @binh_bau.destroy

    respond_to do |format|
      format.html { redirect_to admin_binh_baus_url }
      format.json { head :no_content }
    end
  end
end
