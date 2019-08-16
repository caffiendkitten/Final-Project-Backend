class Login < ApplicationRecord
    belongs_to :account
    has_one :password
end
