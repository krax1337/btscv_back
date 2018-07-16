require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    { title: 'new title' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  before { sign_in_as(user) }

  describe 'GET #index' do
    let!(:resume) { create(:resume, user: user) }

    it 'returns a success response' do
      get :index
      expect(response).to be_successful
      expect(response_json.size).to eq 1
      expect(response_json.first['id']).to eq resume.id
    end

    # usually there's no need to test this kind of stuff, it's here for the presentation purpose
    it 'unauth without cookie' do
      request.cookies[JWTSessions.access_cookie] = nil
      get :index
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET #show' do
    let!(:resume) { create(:resume, user: user) }
    before { sign_in_as(user) }

    it 'returns a success response' do
      get :show, params: { id: resume.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do

    context 'with valid params' do
      it 'creates a new Resume' do
        expect {
          post :create, params: { resume: valid_attributes }
        }.to change(resume, :count).by(1)
      end

      it 'renders a JSON response with the new resume' do
        post :create, params: { resume: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(resume_url(Resume.last))
      end

      it 'unauth without CSRF' do
        request.headers[JWTSessions.csrf_header] = nil
        post :create, params: { resume: valid_attributes }
        expect(response).to have_http_status(401)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new resume' do
        post :create, params: { resume: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    let!(:resume) { create(:resume, user: user) }

    context 'with valid params' do
      let(:new_attributes) {
        { title: 'Super secret title' }
      }

      it 'updates the requested resume' do
        put :update, params: { id: resume.id, resume: new_attributes }
        resume.reload
        expect(resume.title).to eq new_attributes[:title]
      end

      it 'renders a JSON response with the resume' do
        put :update, params: { id: resume.to_param, resume: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the resume' do
        put :update, params: { id: resume.to_param, resume: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:resume) { create(:resume, user: user) }

    it 'destroys the requested resume' do
      expect {
        delete :destroy, params: { id: resume.id }
      }.to change(Resume, :count).by(-1)
    end
  end
end
