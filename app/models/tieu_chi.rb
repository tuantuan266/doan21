#encoding: utf-8
class TieuChi < ActiveRecord::Base
	has_many :chi_tiet_binh_baus
  attr_accessible :MoTaTieuChi, :TenTieuChi
  validates_presence_of :MoTaTieuChi, :TenTieuChi, :message => " chưa nhập"
    def to_param
    	@title = self.TenTieuChi.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/,'')
      "#{id}/#{@title.parameterize}.html"
    end
end
