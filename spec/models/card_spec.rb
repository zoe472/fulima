require 'rails_helper'
describe Card do
  describe '#pay' do
    it "user_id, customer_id, card_idが存在すれば登録できる" do
      user = create(:user)
      card = build(:card, user_id: user.id)
      expect(card).to be_valid
    end
  end
end
# RSpec.describe Card, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"