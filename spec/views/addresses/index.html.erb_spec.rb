require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :state => 2,
        :city => "City",
        :cep => "Cep",
        :district => "District",
        :street => "Street",
        :user => nil
      ),
      Address.create!(
        :state => 2,
        :city => "City",
        :cep => "Cep",
        :district => "District",
        :street => "Street",
        :user => nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
