require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "show" do
    it "shows a user" do
      user = User.create
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it "returns success" do
      user = User.create
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      user = User.create
      get :show, id: user.id
      expect(response).to render_template("show")
    end

    it "renders the not found template" do
      get :show, id: 0
      expect(response).to render_template("not_found")
    end
  end
end
