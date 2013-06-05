class CreateNhanXetTqs < ActiveRecord::Migration
  def change
    create_table :nhan_xet_tqs do |t|
      t.integer :binh_bau_id
      t.integer :user_id
      t.string :NoiDung

      t.timestamps
    end
  end
end
