# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username: "Sarah", password: "12345", email: "something@emails.com")
    account1 = Account.create(user_id: user1.id, account_name: "Google")
        login1 = Login.create(username: "SaRaH1",  account_id: account1.id)
        password1 = Password.create(login_id: login1.id, password_digest: "fjdskla;fdksa;fjkdsla;")
        
        login4 = Login.create(username: "sarah.first@gmail.com",  account_id: account1.id)
        password4 = Password.create(login_id: login4.id, password_digest: "fjkdslashorter")

    account3 = Account.create(user_id: user1.id, account_name: "Reddit")
        login3 = Login.create(username: "sarah.first22@gmail.com",  account_id: account3.id)
        password3 = Password.create(login_id: login3.id, password_digest: "fjkdslashorter")


user2 = User.create(username: "Jake", password: "23456", email: "somethingelse@emails.com")
    account2 = Account.create(user_id: user2.id, account_name: "Facebook")
        login2 = Login.create(username: "Jake123",  account_id: account2.id)
        password2 = Password.create(login_id: login2.id, password_digest: "fjdskla;fdksa;fjkdsla;")