class CreateTruongs < ActiveRecord::Migration
  def change
    create_table :truongs do |t|
      t.string :TenTruong
      t.string :LienLac
      t.text :GioiThieu
      t.string :ToaDo
      t.string :Logo

      t.timestamps
    end
  end
end
