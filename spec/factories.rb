FactoryGirl.define do
  factory :usager do
    name                  "Pierre Lasante"
    email                 "plasante@email.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end