require 'rails_helper'
Rspec.describe Plan "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end
    it 'Commentモデルを多数持っている' do
      is_expected.to have_many(:comments)
    end
  end
  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "user_idを保存していない" do
        expected(FactoryBot.build(:plan)).to_not be_valid
      end
      it "departureが空欄" do
        expect(FactoryBot.build(:plan, :no_departure)),to_not be_valid
      end
      it "shelterが空欄" do
        expect(FactoryBot.build(:plan, :no_shelter)),to_not be_valid
      end
      it "distanceが空欄" do
        expect(FactoryBot.build(:plan, :no_distance)),to_not be_valid
      end
      it "durationが空欄" do
        expect(FactoryBot.build(:plan, :no_duration)),to_not be_valid
      end                  
    end
  end
end