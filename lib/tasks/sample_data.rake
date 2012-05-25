namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Malcolm Reynolds",
                         email: "mal@pacermate.com",
                         password: "password",
                         password_confirmation: "password")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@pacermate.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      stable_name = Faker::Name.first_name
      users.each { |user| user.horses.create!(stable_name: stable_name) }
    end

  end
end