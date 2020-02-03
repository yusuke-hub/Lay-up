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
    feature "有効でない内容のサインアップの確認" do
      before do
        visit new_user_registration_path
        find_field('user[name]').set(nil)
        find_field('user[email').set("bb@bb")
        find_field('user[phone_nunmer]').set("111111")
        find_field('user[account_id]').set("11111111")
        find_field('user[password').set("bbbbbb")
        find_field('user[password_confirmation').set("bbbbbb")
        find("input[name='commit'").click
      end
      scenario "リダイレクト先は正しいか" do
        expect(page).to have_current_path new_user_registration_path
      end
      scenario "エラーメッセージは正しく表示されるか" do
        expect(page).to have_content "error"
      end
    end
    feature "ログインの確認" do
      before do
        visit new_user_session_path
        find_field('user[email]').set("aa@aa")
        find_field('user[password]').set("aaaaaa")
        find("input[name='commit']").click
      end
      scenario "リダイレクト先は正しいか" do
        expect(page).to have_current_path root_path
      end
    end
    feature "有効でない内容のログインの確認" do
      before
        visit new_user_session_path
        find_field('user[email]').set(nil)
        find_field('user[password]').set(nil)
        find("input[name='commit']").click
      end
      scenario "リダイレクト先は正しいか" do
        expect(page).to have_current_path new_user_session_path
      end
    end
    feature "ログアウトの確認" do
      before do
        login(@user)
        visit user_path(@user)
        all("a[data-method='delete'][href='/users/sign_out']")[0].click
      end
      scenario "正しくログアウトしてリダイレクトされているか" do
        expect(page).to have_current_path new_user_registration_path
      end
      scenario "サクセスメッセージは正しく表示されているか" do
        expect(page).to have_content "successfully"
      end
    end
    featureb"ヘッダーのリンクの確認" do
      scenario "ログイン時" do
        login(@user)
        visit root_path
        expect(page),to have_link "", href: root_path
        expect(page),to have_link "", href: group_path(@user)
        expect(page),to have_link "", href: plan_path(@user)
        expect(page),to have_link "", href: destroy_user_session_path
        expect(page),to have_link "", href: new_plan_path
        expect(page),to have_link "", href: new_group_path
        expect(page),to have_link "", href: users_path        
      end
      scenario "ログアウト時" do
        visit root_path
        expect(page),to have_link "", href: root_path
        expect(page),to have_link "", href: new_user_registration_path
        expect(page),to have_link "", href: new_user_session_path
      end
    end
end