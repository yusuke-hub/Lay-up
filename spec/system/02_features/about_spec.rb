require 'rails_helper'
Rspec.feature "Topページ,サインアップ,ログイン,ログアウトに関するテスト", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end
  feature "サインアップの確認" do
    before do
      visit new_user_registration_path
      find_field('user[name]').set("name_a")
      find_field('user[email]').set("aa@aa")
      find_field('user[phone_nunmer]').set("000000")
      find_field('user[account_id]').set("00000000")
      find_field('user[password]').set("aaaaaa")
      find_field('user[password_confirmation]').set("aaaaaa")
    end
    scenario "正しくサインアップできているか" do
      expect {
        find("input[name='commit'").click
      }.to change(User, :count).by(1)
    end
    scenario "リダイレクト先は正しいか" do
        find("input[name='commit'").click
        expect(page).to have_current_path user_path(User.last)
    end
    scenario "サクセスメッセージは正しく表示されるか" do
        find("input[name='commit'").click
        expect(page).to have_current_path user_path(User.last)
    end
  end
end