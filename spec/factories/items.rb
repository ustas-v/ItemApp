# -*- encoding: utf-8 -*-

# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :item do
    name Faker::Lorem.word
    picture {
      fixture_file_upload("#{Rails.root}/spec/fixtures/pictures/test-image.jpg", 'image/jpeg')
    }
  end
end
