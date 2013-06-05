class ChiTietTruong < ActiveRecord::Base
	belongs_to :chi_tiet_binh_bau
	belongs_to :truong
	has_many :lich_su_binh_baus
  attr_accessible :chi_tiet_binh_bau_id, :truong_id
end
