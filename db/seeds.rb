2.times do |i|
  @user = User.create(email: "test#{i}@gmail.com",
                      username: "test#{i}",
                      password: "test#{i}@gmail.com",
                      password_confirmation: "test#{i}@gmail.com")
end
