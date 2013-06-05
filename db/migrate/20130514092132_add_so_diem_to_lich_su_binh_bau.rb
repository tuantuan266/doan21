class AddSoDiemToLichSuBinhBau < ActiveRecord::Migration
  def change
    add_column :lich_su_binh_baus, :SoDiem, :integer, :default => 0
  end
end
