class Admin::UsersController < UsersController
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
     @users = User.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
     if params[:search] != nil
     	@users = User.paginate(:per_page => 10, :page => params[:page]).where(cautruyvan("HoTen",params[:search])).order('created_at DESC')
     end
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @users }
    end
  end
end
