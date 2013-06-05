class Admin::TieuChisController < TieuChisController
layout 'admin'
	before_filter :admin

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
	def index
     @tieu_chis = TieuChi.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
     if params[:search] != nil
     	@tieu_chis = TieuChi.paginate(:per_page => 10, :page => params[:page]).where(cautruyvan("TenTieuChi",params[:search])).order('created_at DESC')
     end
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @tieu_chis }
    end
end
end
