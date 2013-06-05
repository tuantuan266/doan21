class LichSuBinhBausController < ApplicationController
  # GET /lich_su_binh_baus
  # GET /lich_su_binh_baus.json
  def index
    @lich_su_binh_baus = LichSuBinhBau.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lich_su_binh_baus }
    end
  end

  # GET /lich_su_binh_baus/1
  # GET /lich_su_binh_baus/1.json
  def show
    @lich_su_binh_bau = LichSuBinhBau.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lich_su_binh_bau }
    end
  end

  # GET /lich_su_binh_baus/new
  # GET /lich_su_binh_baus/new.json
  def new
    @lich_su_binh_bau = LichSuBinhBau.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lich_su_binh_bau }
    end
  end

  # GET /lich_su_binh_baus/1/edit
  def edit
    @lich_su_binh_bau = LichSuBinhBau.find(params[:id])
  end

  # POST /lich_su_binh_baus
  # POST /lich_su_binh_baus.json
  def create
    @lich_su_binh_bau = LichSuBinhBau.new(params[:lich_su_binh_bau])
    @lich_su_binh_bau[:user_id] = session[:FBUser][:id]

    respond_to do |format|
      if @lich_su_binh_bau.save
        #CHECK ĐỂ TĂNG LƯỢT BÌNH BẦU
        @bbau = @lich_su_binh_bau.chi_tiet_truong.chi_tiet_binh_bau.binh_bau
        @lsbb_ = []
        @bbau.chi_tiet_binh_baus.each{ |b1| b1.chi_tiet_truongs.each {|b2| b2.lich_su_binh_baus.each{|b3| @lsbb_.push(b3)}}}
        if @lsbb_.select{ |a| a[:user_id] == session[:FBUser][:id]}.count()<2 
          @bbau[:LuotBinhBau]+=1
          @bbau.save
        end

        format.html { redirect_to "/", notice: 'Lich su binh bau was successfully created.' }
      else
        @lsbb = LichSuBinhBau.where("user_id = ? and chi_tiet_truong_id= ?",@lich_su_binh_bau[:user_id],@lich_su_binh_bau[:chi_tiet_truong_id]).first
        @lsbb[:SoDiem] = @lich_su_binh_bau[:SoDiem]
        @lsbb.save
        format.html { redirect_to "/" }
      end
    end
  end

  # PUT /lich_su_binh_baus/1
  # PUT /lich_su_binh_baus/1.json
  def update
    @lich_su_binh_bau = LichSuBinhBau.find(params[:id])

    respond_to do |format|
      if @lich_su_binh_bau.update_attributes(params[:lich_su_binh_bau])
        format.html { redirect_to @lich_su_binh_bau, notice: 'Lich su binh bau was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lich_su_binh_bau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lich_su_binh_baus/1
  # DELETE /lich_su_binh_baus/1.json
  def destroy
    @lich_su_binh_bau = LichSuBinhBau.find(params[:id])
    @lich_su_binh_bau.destroy

    respond_to do |format|
      format.html { redirect_to admin_lich_su_binh_baus_url }
      format.json { head :no_content }
    end
  end
end
