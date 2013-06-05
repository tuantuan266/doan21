#encoding: utf-8
class Truong < ActiveRecord::Base
	has_many :chi_tiet_truongs
	has_many :nhan_xets
  attr_accessible :GioiThieu, :LienLac, :Logo, :TenTruong, :ToaDo
  validates_presence_of :GioiThieu, :LienLac, :Logo, :TenTruong, :ToaDo, :message => "chưa nhập"
    def to_param
    	@title = self.TenTruong.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/,'')
      "#{id}/#{@title.parameterize}.html"
    end
end
