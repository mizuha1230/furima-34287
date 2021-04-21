require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すれば新規登録ができてトップページに移動する' do
      # トップページに移動する
      # visit root_path
      # トップページに新規登録ページやログインページへ遷移するボタンがあることを確認する
      # expect(page).to have_content('新規登録')
      # expect(page).to have_content('ログイン')
      # 新規登録ページへ移動する
      # visit new_user_registration_path
      # ユーザー情報を入力する
      # fill_in 'ニックネーム', with: @user.nickname
      # fill_in 'メールアドレス', with: @user.email
      # fill_in 'パスワード', with: @user.password
      # fill_in 'パスワード（確認）', with: @user.password_confirmation
      # fill_in 'お名前（全角）', with: @user.last_name
      # fill_in 'お名前（全角）', with: @user.first_name
      # fill_in 'お名前カナ（全角）', with: @user.last_name_kana
      # fill_in 'お名前カナ（全角）', with: @user.first_name_kana
      # fill_in '生年月日', with: @user.birthday
      # 会員登録ボタンを押すとユーザーモデルのカウントが１上がることを確認する
      # expect{
      # find('input[name="commit"]').click
      # }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      # expect(current_path).to eq(root_path)
      # ユーザーのニックネームやログアウトボタンが表示されることを確認する
      # expect(page).to have_content(current_user.nickname)
      # expect(page).to have_content('ログアウト')
      # 新規登録ページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      # expect(page).to have_no_content('新規登録')
      # expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # 会員登録ボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end
end
