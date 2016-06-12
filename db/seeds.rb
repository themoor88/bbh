#------------------------------------------------------------------------------
# Create tech provider user
User.create!(
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
  email: 'wjkagzi@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_provider,
  active: true
)

User.create!(
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
  email: 'wjkagzi+1@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_provider,
  active: true
)

#------------------------------------------------------------------------------
# Create tech seeker user
User.create!(
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
  email: 'wjkagzi+2@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_seeker,
  active: true
)

User.create!(
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
  email: 'wjkagzi+3@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: :tech_seeker,
  active: true
)

#------------------------------------------------------------------------------
# Create admin user
Admin.create! email: 'delescure@me.com', password: 'password', password_confirmation: 'password'

n_campaigns_per_user = 5

n_campaigns_per_user.times do
  Campaign.create! title: 'Title', user: User.fourth, sector: :cosmetic, country: 'Canada', expires_at: Time.zone.now + rand(0..100).ceil.days, state: 'active'
end

n_campaigns_per_user.times do
  SliderItem.create! title: Faker::App.name, active: true
end
