require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :state => 2,
      :city => "City",
      :cep => "Cep",
      :district => "District",
      :street => "Street",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(//)
  end
end
