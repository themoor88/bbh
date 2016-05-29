#------------------------------------------------------------------------------
# Create tech provider user
User.create! email: 'chantal_provider@example.com', password: 'password', password_confirmation: 'password', role: :tech_provider
User.create! email: 'chantal_provider2@example.com', password: 'password', password_confirmation: 'password', role: :tech_provider

#------------------------------------------------------------------------------
# Create tech seeker user
User.create! email: 'chantal_seeker@example.com', password: 'password', password_confirmation: 'password', role: :tech_seeker
User.create! email: 'chantal_seeker2@example.com', password: 'password', password_confirmation: 'password', role: :tech_seeker

#------------------------------------------------------------------------------
# Create admin user
Admin.create! email: 'chantal_admin@example.com', password: 'password', password_confirmation: 'password'

n_campaigns_per_user = 5

n_campaigns_per_user.times do
  Campaign.create! user: User.fourth, sub_title: Faker::Hipster.word, sector: :cosmetic, country: 'Canada'
end

# n_campaigns_per_user.times do
#   Campaign.create! user: TechSeeker.second, name: Faker::App.name, description: Faker::Lorem.paragraph
# end
