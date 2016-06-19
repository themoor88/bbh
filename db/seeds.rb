#------------------------------------------------------------------------------
# Create tech provider user
user1 = User.new(
  title: 'Mr.',
  position: 'developer',
  company: 'Cool Beans',
  telephone: '416-792-7222',
  address: '33 Cool Street',
  city: 'Toronto',
  country: 'Canada',
  number_of_employees: '1-10',
  company_website: 'http://www.google.ca',
  first_name: 'Chantal',
  last_name: 'Grillot',
  email: 'chantal_provider@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_provider,
  active: true
)
user1.skip_confirmation!
user1.save!

user2 = User.new(
  title: 'Dr.',
  position: 'doctor',
  company: 'Awesome Sauce',
  telephone: '416-790-7666',
  address: '87 box street',
  city: 'Mississauga',
  country: 'Canada',
  number_of_employees: '1-10',
  company_website: 'http://www.google.ca',
  first_name: 'Wajid',
  last_name: 'Kagzi',
  email: 'chantal_provider2@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_provider,
  active: true
)
user2.skip_confirmation!
user2.save!

#------------------------------------------------------------------------------
# Create tech seeker user
user3 = User.new(
  title: 'Dr.',
  position: 'doctor',
  company: 'Awesome Sauce',
  telephone: '416-790-7666',
  address: '87 box street',
  city: 'Mississauga',
  country: 'Canada',
  number_of_employees: '1-10',
  company_website: 'http://www.google.ca',
  first_name: 'Matthew',
  last_name: 'Cavdar',
  email: 'chantal_seeker@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_seeker,
  active: true
)
user3.skip_confirmation!
user3.save!

user4 = User.new(
  title: 'Mr.',
  position: 'developer',
  company: 'Cool Beans',
  telephone: '416-792-7222',
  address: '33 Cool Street',
  city: 'Toronto',
  country: 'Canada',
  number_of_employees: '1-10',
  company_website: 'http://www.google.ca',
  first_name: 'Iron',
  last_name: 'Man',
  email: 'chantal_seeker2@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_seeker,
  active: true
)
user4.skip_confirmation!
user4.save!

#------------------------------------------------------------------------------
# Create admin user
Admin.create! email: 'delescure@me.com', password: 'password', password_confirmation: 'password'
Admin.create! email: 'chantal@baehl-innovation.com', password: 'password', password_confirmation: 'password'

# n_campaigns_per_user = 5

# n_campaigns_per_user.times do
#   Campaign.create! title: 'Title', user: User.fourth, sector: :cosmetic, country: 'Canada', expires_at: Time.zone.now + rand(0..100).ceil.days, state: 'active'
# end

# n_campaigns_per_user.times do
#   SliderItem.create! title: Faker::App.name, active: true
# end
