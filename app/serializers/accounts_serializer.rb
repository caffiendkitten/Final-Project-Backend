class AccountsSerializer < ActiveModel::Serializer
  attributes :id, :account_name, :user_id, :logins

  def logins
    object.logins.collect{|l| LoginsSerializer.new(l)}
  end
end
