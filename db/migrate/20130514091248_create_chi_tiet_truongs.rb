class CreateChiTietTruongs < ActiveRecord::Migration
  def change
    create_table :chi_tiet_truongs do |t|
      t.integer :chi_tiet_binh_bau_id
      t.integer :truong_id

      t.timestamps
    end
  end
end
