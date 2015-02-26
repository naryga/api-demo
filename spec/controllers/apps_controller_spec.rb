require 'rails_helper'

describe AppsController, type: :controller do
  describe "a GET to #index" do
    let!(:apps) { create_list(:capp_with_cats, 2) }

    it "assigns to @apps" do
      get :index

      expect(assigns(:apps)).to eq(apps)
    end
  end

  describe "a GET to #show" do
    
  end
  describe "a POST to #create" do
    let(:params) { { name: 'New App', categories_attributes: [ { name: 'cat1' }, { name: 'cat2' } ] } }

    let(:action) { ->{ post :create, app: params } }

    let!(:app) { build(:bapp_with_cats) }
    before { allow(App).to receive(:new).with(params).and_return(app) }

    it "assigns to @app" do
      action.call
      expect(assigns(:app)).to eq(app)
    end

    context "a successfull save" do
      it "returns a successfull message" do
        action.call
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json['message']).to eq('App created successfully')
      end

      context "with categories" do

        # let!(:app_with_categories) { build(:bapp_with_cats) }
        # before { allow(App).to receive(:new).with(params2).and_return(app_with_categories) }

        it "saves successfully" do
          action.call
          expect(response).to be_success
          json = JSON.parse(response.body)
          expect(json['message']).to eq('App created successfully')
        end
      end
    end

    context "a non-successful save" do
      before { allow_any_instance_of(App).to receive(:save).and_return(false) }

      it "returns a 400 error"

      it "returns a failure notice" do
        action.call
        json = JSON.parse(response.body)
        expect(json['message']).to eq('App not saved')
      end
    end
  end
end
