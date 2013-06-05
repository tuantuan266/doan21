class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :UserName
      t.string :PassWord

      t.timestamps
    end
  end
end
