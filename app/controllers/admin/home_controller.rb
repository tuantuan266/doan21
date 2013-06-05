#encoding: utf-8
class Admin::HomeController < ApplicationController
layout 'admin'
  def index

  	
  	if request.post?
  	  if admin=Admin.kiemtra?(params[:username], params[:pass])
	    session[:user_id] = admin.id
		else
	    flash[:notice] = "Username hoặc mật khẩu chưa đúng !"
	  end
	else
		flash[:notice] = ""
	end



  	if params[:accessdeny]
		flash[:notice] = "Chưa đăng nhập !"
	end
  end

  def logout
	  session[:user_id] = nil
	  flash[:notice] = "Thoát thành công !!"
  end

end
