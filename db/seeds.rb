#------------------------------------------------------------------------------
# Create tech provider user
TechProvider.create email: 'chantal_provider@example.com', password: 'password', password_confirmation: 'password'
TechProvider.create email: 'chantal_provider2@example.com', password: 'password', password_confirmation: 'password'

#------------------------------------------------------------------------------
# Create tech seeker user
TechSeeker.create email: 'chantal_seeker@example.com', password: 'password', password_confirmation: 'password'
TechSeeker.create email: 'chantal_seeker2@example.com', password: 'password', password_confirmation: 'password'

#------------------------------------------------------------------------------
# Create admin user
Admin.create email: 'chantal_admin@example.com', password: 'password', password_confirmation: 'password'

n_campaigns_per_tech_seeker = 5
n_proposed_solutions_per_tech_provider = 5

n_campaigns_per_tech_seeker.times do
  Campaign.create tech_seeker: TechSeeker.first, name: Faker::App.name, description: Faker::Lorem.paragraph
end

n_campaigns_per_tech_seeker.times do
  Campaign.create tech_seeker: TechSeeker.second, name: Faker::App.name, description: Faker::Lorem.paragraph
end

n_proposed_solutions_per_tech_provider.times do
  ProposedSolution.create tech_provider: TechProvider.first, campaign: Campaign.all.sample, name: Faker::App.name, description: Faker::Lorem.paragraph
end

n_proposed_solutions_per_tech_provider.times do
  ProposedSolution.create tech_provider: TechProvider.second, campaign: Campaign.all.sample, name: Faker::App.name, description: Faker::Lorem.paragraph
end

