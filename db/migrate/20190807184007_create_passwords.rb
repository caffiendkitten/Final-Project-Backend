class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :password_digest
      t.integer :login_id

      t.timestamps
    end
  end
end
