class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :MaUser
      t.string :HoTen
      t.boolean :Active

      t.timestamps
    end
  end
end
