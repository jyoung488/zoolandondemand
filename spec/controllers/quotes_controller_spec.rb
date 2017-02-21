require 'rails_helper'

describe QuotesController do
  describe "GET quotes#index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
