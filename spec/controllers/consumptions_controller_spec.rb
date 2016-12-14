require 'rails_helper'

RSpec.describe ConsumptionsController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe ConsumptionsController do
    describe "GET index" do
      it "It retrives a consumption belonging to the user" do
        get :index
        expect(subject.current_user).not_to eq nil
        expect(assigns(:consumption)).to be_instance_of(Consumption)
        expect(assigns(:consumption).user).to eq(subject.current_user)
      end

      it "gets the existing consumption data if it exists" do
        consumption = FactoryGirl.create(:consumption, user: subject.current_user)
        get :index
        expect(subject.current_user).not_to eq nil
        expect(assigns(:consumption)).to be_instance_of(Consumption)
        expect(assigns(:consumption)).to eq(consumption)
      end
    end

    describe "PATCH update" do
      let(:consumption) { FactoryGirl.create(:consumption, user: subject.current_user) }
      let(:new_data) { {sunday: "0", monday: "2", tuesday: "3", wednesday: "4", thursday: "5", friday: "6", saturday: "7" }}

      before do
        put :update, xhr: true, params: {
            id: consumption,
            consumption:
            {
              sunday: "1",
              monday: "2",
              tuesday: "3",
              wednesday: "4",
              thursday: "5",
              friday: "6",
              saturday: "7"
            }
          }, format: :js
      end

      it "assigns the new values" do
        expect(assigns(:consumption).day_set).to eq [1, 2, 3, 4, 5, 6, 7]
      end
    end

    describe "DELETE destroy" do
      let(:consumption) { FactoryGirl.create(:consumption, user: subject.current_user) }

      it "resets the project to zeros" do
        delete :destroy, xhr: true, params: { id: consumption.id }
        expect(assigns(:consumption).day_set).to eq [0, 0, 0, 0, 0, 0, 0]
      end
    end
  end
end
