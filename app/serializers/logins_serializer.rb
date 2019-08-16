class LoginsSerializer < ActiveModel::Serializer
  attributes :id, :username, :saved_password, :account_id

  def saved_password
    object.password.password_digest
  end
end
