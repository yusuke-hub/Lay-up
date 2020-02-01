require 'rails_helper'

describe '避難先登録機能', type: :system do
  describe 'トップ画面表示機能' do
    before do 
      user_t = FactoryBot.create(:user)
      # plan_t = FactoryBot.create(:plan, name: '最初の計画', user: user_t)
    end
    context 'ユーザーTがログインしている時' do
      before do
        visit user_session_path
        fill_in 'メールアドレス', with: 'test1@test.com'
        fill_in 'パスワード', with: '111111'
        click_button 'ログインする'
      end
      it 'ホームのトップ画面が表示される' do
        expect(page).to have_content 'ホームのトップ画面'
      end
    end
  end
end
