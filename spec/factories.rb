# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Steve Thomas"
  user.email                 "steve.michael.thomas@gmail.com"
  user.password              "hello"
  user.password_confirmation "hello"
end