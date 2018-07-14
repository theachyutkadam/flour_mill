require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :item_name => "MyString",
      :rate => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_item_name[name=?]", "item[item_name]"

      assert_select "input#item_rate[name=?]", "item[rate]"
    end
  end
end
