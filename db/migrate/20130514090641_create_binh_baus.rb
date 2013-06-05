class CreateBinhBaus < ActiveRecord::Migration
  def change
    create_table :binh_baus do |t|
      t.string :TenBinhBau
      t.text :MoTaBinhBau
      t.integer :MaxSao
      t.date :NgayBatDau
      t.date :NgayKetThuc
      t.boolean :Active

      t.timestamps
    end
  end
end
