require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :state => 1,
      :city => "MyString",
      :cep => "MyString",
      :district => "MyString",
      :street => "MyString",
      :user => nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[cep]"

      assert_select "input[name=?]", "address[district]"

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[user_id]"
    end
  end
end
