require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do
    let (:my_wiki) {create(:wiki)}

    describe "GET index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_success(:success)
        end

        it "assigns Wiki.all to wiki" do
            get :index
            expect(assigns(:wikis)).to eq([my_wiki])
        end
    end

end
