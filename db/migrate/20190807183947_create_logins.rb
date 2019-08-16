class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.integer :account_id
      t.string :username

      t.timestamps
    end
  end
end
