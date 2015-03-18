user = User.new
user.name = 'Alex'
user.email = 'alex@dunae.ca'
user.password = 'alex'
user.admin = true
user.save!

User.create!(name: 'Other guy', email: 'other@example.com', password: 'other')
