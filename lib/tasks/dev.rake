namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all
    Comment.destroy_all
    User.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample)
    end
    puts "Have created fake restaurant"
    puts "now you have #{Restaurant.count} restaurants data"

    20.times do |i|
      User.create(email: FFaker::Internet.email, password: "12345678", role: "")
    end
    puts "creat user done (#{User.count} users)"

    Restaurant.all.each do |restaurant|
      3.times do |i|
        @comment = restaurant.comments.build(content: FFaker::Tweet.body)
        @comment.user =  User.all.order("random()").first
        @comment.save!
      end
    end
    puts "creat comments done"

  end
end
