require 'rails_helper'

describe User do
  it { should have_many :outlines }

  it { should validate_presence_of :name }

  it("titleizes the name of a user") do
    new_user = User.create({ name: "vanessa", email: "test", password: "test", password_confirmation: "test" })
    expect(new_user.name).to(eq("Vanessa"))
  end
end