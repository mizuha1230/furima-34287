FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}

    person = Gimei.name
    last_name             {person.last.kanji}
    last_name             {person.last.katakana}
    last_name             {person.last.hiragana}
    first_name            {person.first.kanji}
    first_name            {person.first.katakana}
    first_name            {person.first.hiragana}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end