require 'rails_helper'
Rspec.describe User "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it 'Planモデルを多数持っている' do
      is_expected. to have_many(:plans)
    end
    it 'Belongingモデルを通じて、Groupモデルを多数持っている' do
      is_expected. to have_many(:groups)
    end    
    it 'Belongingモデルを多数持っている' do
      is_expected. to have_many(:belongings)
    end    
    it 'Commentモデルを多数持っている' do
      is_expected. to have_many(:comments)
    end    
  end
  describe '実際に保存してみる' do
    context '保存できる場合' do
       it "画像データなし"
         expect(FactoryBot.create(:user)).to be_valid
       end
       it "画像データあり"
        expect(FactoryBot.create(:user, :crete_with_image)).to be_valid?
       end
    end
    context "保存できない場合" do
      it "nameが空欄" do
        expect(FactoryBot.build(:user, :no_name).to_not be_valid)
      end
      it "phone_numberが空欄" do
        expect(FactoryBot.build(;user, :no_phone_number).to_not be_valid)
      end
      it "account_idが空欄" do
        expect(FactoryBot.build(;user, :no_account_id).to_not be_valid)
      end       
      it "account_idが7文字以下" do
        expect(FactoryBot.build(;user, :too_short_account_id).to_not be_valid)
      end       
      it "account_idが13文字以上" do
        expect(FactoryBot.build(;user, :too_long_account_id).to_not be_valid)
      end             
    end
  end
end