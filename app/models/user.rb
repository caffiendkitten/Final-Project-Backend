class User < ApplicationRecord
    has_many :accounts
    has_many :logins, :through => :accounts
    has_secure_password
    validates :username, uniqueness: { case_sensitive: true }, :length => { :in => 6..20 }
    validates :password, length: { :in => 8..20 }
end
