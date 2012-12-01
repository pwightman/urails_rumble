Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.provider "Github"
end

Factory.define :team do |f|
  f.sequence(:name) { |n| "Team#{n}" }
  f.password "test"
end