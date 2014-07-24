require 'rails_helper'

RSpec.describe User, :type => :model do
  context "setting params" do
    it "can assign name" do
      name = "SomeName"
      user = User.new name: name
      expect(user.name).to eq(name)
    end

    it "can assign surname" do
      surname = "SomeSurName"
      user = User.new surname: surname
      expect(user.surname).to eq(surname)
    end

    it "can assign email" do
      email = "email@test.com"
      user = User.new email: email
      expect(user.email).to eq(email)
    end
  end

  context "persisting" do
    it "persists a user with all params" do
      user = User.new name: "SomeName",
                      surname: "SurName",
                      email: "email@test.de"

      expect(user.save).to eq(true)
    end
  end
end
