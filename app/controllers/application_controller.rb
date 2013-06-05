#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  private
  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def admin
  	if session[:user_id] == nil
  		redirect_to "/admin?accessdeny=true"
  	end
  end

  def showmap(dstruong)
    y_max = dstruong.max_by{|i| i[:ToaDo].to_s.split(", ")[0].to_f}[:ToaDo].to_s.split(", ")[0].to_f
    y_min = dstruong.min_by{|i| i[:ToaDo].to_s.split(", ")[0].to_f}[:ToaDo].to_s.split(", ")[0].to_f
    x_max = dstruong.max_by{|i| i[:ToaDo].to_s.split(", ")[1].to_f}[:ToaDo].to_s.split(", ")[1].to_f
    x_min = dstruong.min_by{|i| i[:ToaDo].to_s.split(", ")[1].to_f}[:ToaDo].to_s.split(", ")[1].to_f
    @y_p = (y_min+y_max)/2
    @x_p = (x_min+x_max)/2
    zzoom = y_max-y_min
    @zoom = 2
    if zzoom<0.03 then @zoom=14 elsif zzoom<0.04 then @zoom=13 elsif zzoom<0.2 then @zoom=12 elsif zzoom<=8 then @zoom=7
    elsif zzoom<=15 then @zoom=6 elsif zzoom<=25 then @zoom=5 end

    return  {:zoom => @zoom, :y_p => @y_p, :x_p => @x_p}
  end

end
