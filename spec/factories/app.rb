FactoryGirl.define do
  factory :app do
    name "MyString"

    factory :bapp_with_cats do
      transient do
        cat_count 5
      end

      after(:create) do |app, evaluator|
        build_list(:category, evaluator.cat_count, app: app)
      end
    end

    factory :capp_with_cats do
      transient do
        cat_count 5
      end

      after(:create) do |app, evaluator|
        create_list(:category, evaluator.cat_count, app: app)
      end
    end
  end
end
