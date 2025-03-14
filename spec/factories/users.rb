FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password              {'00aa00'}
    password_confirmation {password}
    name_zennkaku_myouzi {'赤差'}
    name_zennkaku_namae  {'棚'}
    name_kana_myouzi     {'アカサ'}
    name_kana_namae      {'タナ'}
    birthday             {'20000312'}
    
  end
end
