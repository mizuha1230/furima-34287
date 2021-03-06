FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'test12' }
    password_confirmation { password }

    person = Gimei.name
    last_name             { person.last.kanji or person.last.hiragana or person.last.katakana }
    first_name            { person.first.kanji or person.first.hiragana or person.first.katakana }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
