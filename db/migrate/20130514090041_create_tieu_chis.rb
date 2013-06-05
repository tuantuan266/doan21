class CreateTieuChis < ActiveRecord::Migration
  def change
    create_table :tieu_chis do |t|
      t.string :TenTieuChi
      t.text :MoTaTieuChi

      t.timestamps
    end
  end
end
