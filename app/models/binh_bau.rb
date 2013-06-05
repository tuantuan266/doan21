#encoding: utf-8
class BinhBau < ActiveRecord::Base
	has_many :chi_tiet_binh_baus
	has_many :tieu_chis, :through => :chi_tiet_binh_baus
	has_many :nhan_xet_tqs

  	attr_accessible :Active, :MaxSao, :MoTaBinhBau, :NgayBatDau, :NgayKetThuc, :TenBinhBau, :LuotXem, :LuotBinhBau
  	validates_presence_of :TenBinhBau, :MoTaBinhBau, :NgayBatDau, :NgayKetThuc, :MaxSao, :message => " chưa nhập"
    def to_param
    	@title = self.TenBinhBau.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/,'')
      "#{id}/#{@title.parameterize}.html"
    end
end
