# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Post.destroy_all

puts "Seeding Posts..."
Post.create!(
  title: "5 ways to speed up your web app",
  video_url: "https://www.youtube.com/embed/XNDOqznkZ4Y?si=6WuJwk8qqBdM4EUK",
  created_at: Faker::Time.backward(days: 7),
  updated_at: Time.now,
  pro: true
)

Post.create!(
  title: "5 ways to speed up your web app",
  video_url: "https://www.youtube.com/embed/XNDOqznkZ4Y?si=6WuJwk8qqBdM4EUK",
  created_at: Faker::Time.backward(days: 7),
  updated_at: Time.now,
  pro: true
)

Post.create!(
  title: "5 ways to speed up your web app",
  video_url: "https://www.youtube.com/embed/XNDOqznkZ4Y?si=6WuJwk8qqBdM4EUK",
  created_at: Faker::Time.backward(days: 7),
  updated_at: Time.now,
  pro: false
)

Post.create!(
  title: "5 ways to speed up your web app",
  video_url: "https://www.youtube.com/embed/XNDOqznkZ4Y?si=6WuJwk8qqBdM4EUK",
  created_at: Faker::Time.backward(days: 7),
  updated_at: Time.now,
  pro: true
)

Post.create!(
  title: "5 ways to speed up your web app",
  video_url: "https://www.youtube.com/embed/XNDOqznkZ4Y?si=6WuJwk8qqBdM4EUK",
  created_at: Faker::Time.backward(days: 7),
  updated_at: Time.now,
  pro: false
)

Category.create!([
  {name: "Ruby"},
  {name: "Rails"},
  {name: "JavaScript"},
  {name: "PHP"}
])

puts "Email: #{Rails.application.credentials.dig(:admin, :email).inspect}"
admin_email = Rails.application.credentials.dig(:admin, :email)
admin_password = Rails.application.credentials.dig(:admin, :password)


if admin_email.present? && admin_password.present?
  unless User.exists?(email: admin_email)
    User.create!(
      email: admin_email,
      password: admin_password,
      password_confirmation: admin_password,
    )
    puts "Admin user created"
  else
    puts "Admin user already exists"
  end
else
  puts "Admin credentials not found in credentials file"
end

puts " Done seeding!"