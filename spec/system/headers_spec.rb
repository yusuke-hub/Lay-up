require 'rails_helper'

describe 'ヘッダーリンク遷移機能', type: :system do
  describe 'Noahとは?' do
    before do
      user_t = FactoryBot.create(:user)
      visit  new_user_session_path
      fill_in "メールアドレス", with: 'test1@test.com'
      fill_in "パスワード", with: '111111'
      click_button "ログイン"
      click_link "Noahとは？"
    end
    context 'リンクをクリック' do
      it 'トップ画面を表示される' do
        expect(page).to have_content '使い方ガイド' 
      end
    end
  end
  describe 'あなたのグループ' do
    before do
      user_t = FactoryBot.create(:user)
      visit  new_user_session_path
      fill_in "メールアドレス", with: 'test1@test.com'
      fill_in "パスワード", with: '111111'
      click_button "ログイン"      
      click_link "あなたのグループ"
    end
    context 'リンクをクリック' do
      it 'あなたのグループ画面を表示' do
        expect(page).to have_content 'グループ名' 
      end
    end
  end
end