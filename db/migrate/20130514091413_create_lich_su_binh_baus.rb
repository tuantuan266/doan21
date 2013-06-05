class CreateLichSuBinhBaus < ActiveRecord::Migration
  def change
    create_table :lich_su_binh_baus do |t|
      t.integer :chi_tiet_truong_id
      t.integer :user_id

      t.timestamps
    end
  end
end
