class User < ActiveRecord::Base
	has_many :lich_su_binh_baus
	has_many :nhan_xets
	has_many :nhan_xet_tqs
  attr_accessible :Active, :HoTen, :MaUser
  
  validates :MaUser, :uniqueness => true
end
