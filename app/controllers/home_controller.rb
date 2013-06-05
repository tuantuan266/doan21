#encoding: utf-8
class HomeController < ApplicationController
  def index
  	@toptieuchi = TieuChi.first(10).sort_by{|i| i.SoLuongBinhBau}.reverse
  	@topbinhbau = BinhBau.first(10).sort_by{|i| i.LuotBinhBau}.reverse
  	@toptruong=Truong.first(10).sort_by{|i| i.SoLuongBinhBau}.reverse
  	@newbinhbau=BinhBau.paginate(:per_page => 5, :page => params[:page]).where("Active = ? and NgayBatDau <= ? and NgayKetThuc >= ?",true, DateTime.now.to_date, DateTime.now.to_date).order('NgayBatDau DESC')
    #THUẬT TOÁN ZOOM MAP
    @truongs = Truong.all
    @map=showmap(@truongs)

  end

  def timkiem
    #THUẬT TOÁN ZOOM MAP
    @truongs = Truong.all
    @map=showmap(@truongs)

  	#KHAI BÁO BIẾN
  	@key = params[:key].to_s
  	@ctruong = params[:TKtruong]
  	@cbinhbau = params[:TKbinhbau]
  	@ctchi = params[:TKtieuchi]
  	@datef = params[:TKdatef]
  	@datet = params[:TKdatet]

  	if @key == "" then
  		@bb = []
  		return
  	elsif !@ctruong&&!@cbinhbau&&!@ctchi
  		@ctruong = 'on'
	  	@cbinhbau = 'on'
	  	@ctchi = 'on'
  	end

  	@cttieuchi = @ctchi
  	#HIGHLIGHT TỪ KHÓA TÌM KIẾM
  	if @cbinhbau then @wordkeybb= @key.split else @wordkeybb=nil end
  	if @ctruong then @wordkeytrg= @key.split else @wordkeytrg=nil end
  	if @ctchi then @wordkeytc= @key.split else @wordkeytc=nil end


  	#XÂY DỰNG CÂU TRUY VẤN
  	@bb = []

  	if @cbinhbau.to_s == 'on'
  		@bb += BinhBau.where(cautruyvan("TenBinhBau",@key))
  	end
  	if @ctruong.to_s == 'on'
  		@truong = Truong.where(cautruyvan("TenTruong",@key))
  		@truong.each do |trg|
  			trg.chi_tiet_truongs.each do |ctt|
  				@bb.push(ctt.chi_tiet_binh_bau.binh_bau)
  			end
  		end
  	end
  	if @cttieuchi.to_s == 'on'
  		@tieuchi = TieuChi.where(cautruyvan("TenTieuChi",@key))
  		@tieuchi.each do |tcc|
  			tcc.chi_tiet_binh_baus.each do |ctt|
  				@bb.push(ctt.binh_bau)
  			end
  		end
  	end

  	@bb.uniq!
  begin
  	Date.parse(@datef.to_s)
  	Date.parse(@datet.to_s)
  rescue ArgumentError
  	return
  end
  	if @datef!=""
  		@bb.delete_if{ |i| i[:NgayBatDau]< Date.parse(@datef) }
  	end
  	if @datet!=""
  		@bb.delete_if{ |i| i[:NgayKetThuc]> Date.parse(@datet) }
  	end
  end
  #HẾT CODE TÌM KIẾM
  def cautruyvan(tencot,chuoi)
    @query = ""
    @ctrim = chuoi.split
    @ctrim.each{ |i| i=i.strip}
    for i in 0...@ctrim.count
        @query+="#{tencot} REGEXP '[[:<:]]#{@ctrim[i]}[[:>:]]' OR "
    end
    @query+= "#{tencot} REGEXP '[[:<:]]1234567890[[:>:]]'"
    return @query
  end
end
