#------------------------------------------------------------------------------
# Create tech provider user
User.create! email: 'chantal_provider@example.com', password: 'password', password_confirmation: 'password', role: :tech_provider, active: true
User.create! email: 'chantal_provider2@example.com', password: 'password', password_confirmation: 'password', role: :tech_provider, active: true

#------------------------------------------------------------------------------
# Create tech seeker user
User.create! email: 'chantal_seeker@example.com', password: 'password', password_confirmation: 'password', role: :tech_seeker, active: true
User.create! email: 'chantal_seeker2@example.com', password: 'password', password_confirmation: 'password', role: :tech_seeker, active: true

#------------------------------------------------------------------------------
# Create admin user
Admin.create! email: 'chantal_admin@example.com', password: 'password', password_confirmation: 'password'

n_campaigns_per_user = 5

n_campaigns_per_user.times do
  Campaign.create! title: 'Title', user: User.fourth, sector: :cosmetic, country: 'Canada', expires_at: Time.zone.now + rand(0..100).ceil.days, state: 'active'
end

n_campaigns_per_user.times do
  SliderItem.create! title: Faker::App.name, active: true
end
