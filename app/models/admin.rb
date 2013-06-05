class Admin < ActiveRecord::Base
  attr_accessible :PassWord, :UserName

  def self.kiemtra?(username, password)
    self.find(:first, :conditions => [ "UserName = ? AND PassWord = ?", username, password ])
  end

end
