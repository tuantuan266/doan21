class CreateChiTietBinhBaus < ActiveRecord::Migration
  def change
    create_table :chi_tiet_binh_baus do |t|
      t.integer :binh_bau_id
      t.integer :tieu_chi_id

      t.timestamps
    end
  end
end
