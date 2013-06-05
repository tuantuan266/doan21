class CreateNhanXets < ActiveRecord::Migration
  def change
    create_table :nhan_xets do |t|
      t.integer :chi_tiet_binh_bau_id
      t.integer :truong_id
      t.integer :user_id
      t.string :NoiDung

      t.timestamps
    end
  end
end
