class FixColumnNameFromMasterPasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :master_password, :password_digest

  end
end
