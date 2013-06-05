class ChiTietBinhBau < ActiveRecord::Base
	belongs_to :binh_bau
	belongs_to :tieu_chi
	has_many :chi_tiet_truongs
	has_many :nhan_xets
  attr_accessible :binh_bau_id, :tieu_chi_id
end
