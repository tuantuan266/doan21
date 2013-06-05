class Admin::NhanXetsController < NhanXetsController
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
     @nhan_xets = NhanXet.paginate(:per_page => 10, :page => params[:page]).order('NgayBatDau DESC')
     	if params[:search] != nil
     		@nhan_xets = NhanXet.paginate(:per_page => 10, :page => params[:page]).where(cautruyvan("NoiDung",params[:search])).order('NgayBatDau DESC')
     	end
    	respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @nhan_xets }
   		end
   	end
end
