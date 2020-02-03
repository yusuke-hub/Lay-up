require 'rails_helper'

describe 'ログイン機能', type: :system do
  describe 'ログイン後トップ画面へ遷移' do
    before do 
      user_t = FactoryBot.create(:user)
    end
    context 'ログイン成功時' do
      before do
        visit  new_user_session_path
        fill_in "メールアドレス", with: 'test1@test.com'
        fill_in "パスワード", with: '111111'
        click_button "ログイン"
      end
      it 'トップ画面を表示する' do
        expect(page).to have_content '使い方ガイド'
      end
    end
    context 'ログイン失敗時' do
      before do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'test@fail.com'
        fill_in "パスワード", with: '000000'
        click_button "ログイン"
      end
      it 'ログイン画面へ戻る' do
        expect(page).to have_content 'ログイン'
      end
    end
  end
end
