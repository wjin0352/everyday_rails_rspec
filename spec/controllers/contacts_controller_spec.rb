require 'rails_helper'

describe ContactsController do

  describe "GET#show" do
    it "assigns the requested contact to @contact" do
      contact = create(:contact)
      get :show, id: contact
      expect(assigns(:contact)).to eq contact
    end
  end

  it "renders the :show template" do
    contact = create(:contact)
    get :show, id: contact
    expect(response).to render_template :show
  end

  describe "GET#index" do
    context 'with params[:letter]' do
      it "populates an array of contacts starting with the letter" do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      it "renders the :index template" do
        get :index, letter: 'S'
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it 'populates an array of all contacts' do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

end













