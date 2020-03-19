require 'rails_helper'
describe User do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
     user = build(:user)
     expect(user).to be_valid
    end

    it "nicknameカラムが空だと登録できない" do
     user = build(:user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailカラムが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
     end

     it "passwordカラムが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
     end

     it "familynameカラムが空だと登録できない" do
      user = build(:user, familyname: "")
      user.valid?
      expect(user.errors[:familyname]).to include("を入力してください")
     end

     it "nameカラムが空だと登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
     end

     it "kana_familynameカラムが空だと登録できない" do
      user = build(:user, kana_familyname: "")
      user.valid?
      expect(user.errors[:kana_familyname]).to include("を入力してください")
     end

     it "kana_nameカラムが空だと登録できない" do
      user = build(:user, kana_name: "")
      user.valid?
      expect(user.errors[:kana_name]).to include("を入力してください")
     end

     it "birthdayカラムが空だと登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
     end
  end
end