class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :sex
      t.string :address
      t.string :email
      
      t.timestamps
    end
  end
end
