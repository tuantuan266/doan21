#encoding: utf-8
class NhanXet < ActiveRecord::Base
  belongs_to :chi_tiet_binh_bau
  belongs_to :truong
  belongs_to :user
  attr_accessible :NoiDung, :chi_tiet_binh_bau_id, :truong_id, :user_id
  validates_presence_of :NoiDung, :message => " chưa nhập"
end
