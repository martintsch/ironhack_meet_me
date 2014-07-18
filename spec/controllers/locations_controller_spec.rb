require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  describe "GET index" do
    it "assigns @locations" do
      location = Location.create name: "Home", city: "Barcelona"
      get :index
      expect(assigns(:locations)).to eq([location])
    end

    it "renders the index template" do
      location = Location.create name: "Home", city: "Barcelona"
      get :index
      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
    end

    it "renders the no locations template" do
      get :index
      expect(response).to render_template("no_locations")
      expect(response).to have_http_status(404)
    end
  end

  describe "GET show" do
    it "assigns @location" do
      location = Location.create name: "Home", city: "Barcelona"
      get :show, id: location.id
      expect(assigns(:location)).to eq(location)
    end

    it "renders the index template" do
      location = Location.create name: "Home", city: "Barcelona"
      get :show, id: location.id
      expect(response).to render_template("show")
      expect(response).to have_http_status(:ok)
    end

    it "renders the not_found template" do
      get :show, id: 666
      expect(response).to render_template("not_found")
      expect(response).to have_http_status(404)
    end
  end
end
