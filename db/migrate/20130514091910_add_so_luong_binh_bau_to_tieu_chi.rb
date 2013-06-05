class AddSoLuongBinhBauToTieuChi < ActiveRecord::Migration
  def change
    add_column :tieu_chis, :SoLuongBinhBau, :integer, :default => 0
  end
end
