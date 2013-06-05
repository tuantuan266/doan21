class AddLuotXemToBinhBau < ActiveRecord::Migration
  def change
    add_column :binh_baus, :LuotXem, :integer, :default => 0
  end
end
