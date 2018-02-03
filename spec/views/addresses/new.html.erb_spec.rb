require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :state => 1,
      :city => "MyString",
      :cep => "MyString",
      :district => "MyString",
      :street => "MyString",
      :user => nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[cep]"

      assert_select "input[name=?]", "address[district]"

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[user_id]"
    end
  end
end
