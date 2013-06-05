#encoding: utf-8
class NhanXetTq < ActiveRecord::Base
  belongs_to :binh_bau
  belongs_to :user
  attr_accessible :NoiDung, :binh_bau_id, :user_id
  validates_presence_of :NoiDung, :message => " chưa nhập"
end
