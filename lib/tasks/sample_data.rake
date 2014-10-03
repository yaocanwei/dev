namespace :db do
  desc "构造数据库样例数据"

  task populate: :environment do
    User.create!(name: "yaocanwei",
                 email: "124801498@qq.com",
                 password: "588731rumpuk",
                 password_confirmation: "588731rumpuk",
                 admin: true
                )
    99.times do|n|
      name = Faker::Name.name
      email = Faker::Internet.email
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password
                  )
    end
  end
end
