class AddLuotBinhBauToBinhBau < ActiveRecord::Migration
  def change
    add_column :binh_baus, :LuotBinhBau, :integer, :default => 0
  end
end
