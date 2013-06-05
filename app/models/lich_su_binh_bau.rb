class LichSuBinhBau < ActiveRecord::Base
	belongs_to :chi_tiet_truong
	belongs_to :user
  attr_accessible :chi_tiet_truong_id, :user_id, :SoDiem
  validates_uniqueness_of :chi_tiet_truong_id, :scope => :user_id
end
