FactoryBot.define do
  factory :city do
    sequence(:display) {|x| "City #{x}"}
    country

    after :create do |city|
      FactoryBot.create :city_name, city: city, name: "#{city.display}"
      City.update_fulltext_view
    end
  end

  factory :city_name do
    sequence(:name) { |x| "CityName #{x}"}
    language { Language.first || FactoryBot.create(:language) }
  end

  factory :country do
    sequence(:code) {|x| "S#{x}"}
    sequence(:name) {|x| "Country #{x}" }
    sequence(:tld) {|x| ".co#{x}"}
    continent
  end

  factory :continent do
    sequence(:code) {|x| "C#{x}"}
    sequence(:name) {|x| "Continent #{x}" }
  end

end
