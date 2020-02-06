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
      scenario "トップ画面の表示内容とリンク" do
        visit group_path(@user1)
        expect(page).to have_link "", href: user_path
        expect(page).to have_content @user.name
        expect(page).to have_link "", href: root_path
        expect(page).to have_content "Noahとは?"
        expect(page).to have_link "", href: group_path(@user)
        expect(page).to have_content "グループを作る"
        expect(page).to have_link "", href: plan_path(@user)
        expect(page).to have_content "避難計画を作る"
        expect(page).to have_link "", href: destroy_user_session_path     
        expect(page).to have_content "ログアウト"
        expect(page).to have_link "", href: new_plan_path
        expect(page).to have_content "避難計画を作る"
        expect(page).to have_link "", href: new_group_path
        expect(page).to have_content "グループを作る"
        expect(page).to have_link "", href: users_path           
        expect(page).to have_content "友達検索"
      end
      scenario "あなたの避難計画では、ログインユーザーの避難計画が表示される" do
        @user1.plans.each do |plan|
          expect(page).to have_content plan.created_at
          expect(page).to have_link "", href: plan_detail_path(plan)
          expect(page).to have_content plan.departure
          expect(page).to have_content plan.shelter
          expect(page).to have_content plan.distance
          expect(page).to have_content plan.duration
          expect(page).to have_content "削除"
          expect(page).to have_link "", href: plan_path(plan)
        end
        expect(page).to have_content @user
      end
      scenario "避難計画を作る画面の表示内容" do
        visit new_plan_path
        expect(page).to have_selector "form"
        expect(page).to have_content "標高"
        expect(page).to have_content "計算"
      end
      scenario "グループを作る画面でフォームタグを使用しているか" do
        visit new_group_path
        expect(page).to have_selector "form"
        expect(page).to have_content "グループ名"
        expect(page).to have_content "メモ"
      end
      scenario "友達検索画面の表示内容" do
        visit users_path
        expect(page).to have_content "名前"
        expect(page).to have_content "メールアドレス"
        expect(page).to have_content "アカウントID"
        expect(page).to have_content @user1.name
        expect(page).to have_link "", href: user_path(@user1)
        expect(page).to have_content @user1.plans.count
        expect(page).to have_link "", href: plan_path(@user1)
        expect(page).to have_content @user2.name
        expect(page).to have_link "", href: user_path(@user2)
        expect(page).to have_content @user2.plans.count
        expect(page).to have_link "", href: plan_path(@user2)
      end
      scenario "あなたのグループには所属グループのみ表示されるか" do
        visit group_path(@user)
        expect(page).to have_selector "table"         
      end
    end
  end
end