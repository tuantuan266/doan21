class Admin::TruongsController < TruongsController
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
     @truongs = Truong.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
     if params[:search] != nil
     	@truongs = Truong.paginate(:per_page => 10, :page => params[:page]).where(cautruyvan("TenTruong",params[:search])).order('created_at DESC')
     end
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @truongs }
    end
  end
end
