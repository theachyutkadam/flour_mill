require 'rails_helper'

RSpec.describe Item, type: :model do

    before do
      @item = FactoryBot.create(:item)
    end
  context "Verfy Association" do
    it 'should varify the item' do
      expect(@item.item_name?).to eq(true)
    end
    it 'fails when Item blank!' do
      expect(@item.errors[:item_name]).not_to include("can't be blank")
    end
  end

end