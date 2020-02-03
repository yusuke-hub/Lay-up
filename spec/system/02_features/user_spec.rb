require 'rails_helper'
Rspec.feature "Userに関するテスト", type: :feature do
  before do 
    @user1 = FactoryBot.create[:user, :create_with_plans]
    @user2 = FactoryBot.create[:user, :create_with_plans]
  end
  feature "ログインしてない状態で" do
    feature "以下のページへアクセスした際のリダイレクト先の確認" do
      scenario "Noahとは？" do
        visit root_path
        expect(page).to have_content "使い方ガイド"
      end
      scenario "新規登録" do
        visit new_user_registration_path
        expect(page).to have_content "新規登録"
      end
    end
  end
  feature "ログインした状態で" do
    before do 
      login(@user1)
    end
    feature "表示内容とリンクの確認" do
      scenario "あなたのグループ画面の表示内容とリンク" do
        visit group_path(@user1)
        expect(page),to have_link "", href: root_path
        expect(page),to have_link "", href: group_path(@user)
        expect(page),to have_link "", href: plan_path(@user)
        expect(page),to have_link "", href: destroy_user_session_path     
        expect(page),to have_link "", href: new_plan_path
        expect(page).to have_content "避難計画を作る"
        expect(page),to have_link "", href: new_group_path
        expect(page).to have_content "グループを作る"
        expect(page),to have_link "", href: users_path           
        expect(page).to have_content "友達検索"
      end
    end
  end
end