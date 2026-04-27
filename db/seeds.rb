puts "Cleaning up database..."

UserGame.destroy_all
Game.destroy_all

user = User.find_or_create_by!(email: "test@example.com") do |u|
  u.name = "テストユーザー"
  u.password = "password"
  u.password_confirmation = "password"
end

puts "User: #{user.name} へのデータ作成を開始します..."

20.times do |i|
  game = Game.create!(
    title: "#{Faker::Game.title} #{i + 1}",
    publisher: Faker::Company.name,
    release_date: Faker::Date.backward(days: 3650)
  )

  UserGame.create!(
    user: user,
    game: game,
    status: [ 0, 1, 2 ].sample
  )
end

puts "完了！ 20個の積みゲーを作成しました"
