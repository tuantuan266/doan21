class AddSoLuongBinhBauToTruong < ActiveRecord::Migration
  def change
    add_column :truongs, :SoLuongBinhBau, :integer, :default => 0
  end
end
