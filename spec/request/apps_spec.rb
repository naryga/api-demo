require 'rails_helper'

describe "Apps api", type: :request do
    let(:params) { { name: 'New App', categories_attributes: [ { name: 'cat1' }, { name: 'cat2' } ] } }

    it "sends a list of apps" do
      create_list(:app, 10)

      get '/apps'

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['apps'].length).to eq(10)
    end

    describe "creating apps" do
      it "gives an appropriate message" do
        post '/apps', app: params

        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json['message']).to eq('App created successfully')
      end

      it "creates an app" do
        post '/apps', app: params

        get '/apps'
        json = JSON.parse(response.body)
        expect(json['apps'].length).to eq(1)
      end

      it "creates categories for the app" do
        post '/apps', app: params

        get '/apps'
        json = JSON.parse(response.body)
        expect(json['apps'].length).to eq(1)
      end

    end

end
