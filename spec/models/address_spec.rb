require 'rails_helper'
describe Address do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "familynameカラムが空だと登録できない" do
      address = build(:address, familyname: "")
      address.valid?
      expect(address.errors[:familyname]).to include("を入力してください")
     end

    it "nameカラムが空だと登録できない" do
      address = build(:address, name: "")
      address.valid?
      expect(address.errors[:name]).to include("を入力してください")
    end

    it "kana_familynameカラムが空だと登録できない" do
      address = build(:address, kana_familyname: "")
      address.valid?
      expect(address.errors[:kana_familyname]).to include("を入力してください")
    end

    it "kana_nameカラムが空だと登録できない" do
      address = build(:address, kana_name: "")
      address.valid?
      expect(address.errors[:kana_name]).to include("を入力してください")
    end

    it "postalcodeカラムが空だと登録できない" do
      address = build(:address, postalcode: "")
      address.valid?
      expect(address.errors[:postalcode]).to include("を入力してください")
    end

    it "prefectureカラムが空だと登録できない" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityカラムが空だと登録できない" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "addressカラムが空だと登録できない" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

    it "apartmentカラムが空でも登録できる" do
      address = build(:address, apartment: "")
      expect(address).to be_valid
    end

    it "cellphoneカラムが空でも登録できる" do
      address = build(:address, cellphone: "")
      expect(address).to be_valid
    end
  end
end
