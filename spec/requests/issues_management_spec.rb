require 'rails_helper'

RSpec.describe 'Issues management', type: :request do
  describe 'GET index' do
    let!(:issues) { create_list(:issue, 2) }

    it 'lists the issues' do
      get '/issues'
      expect(response).to be_successful

      issues.each do |issue|
        expect(response.body).to include(issue.title)
      end
    end
  end

  describe 'GET show' do
    let!(:issue) { create(:issue) }

    it 'lists the issues' do
      get "/issues/#{issue.id}"
      expect(response).to be_successful
      expect(response.body).to include(issue.title)
      expect(response.body).to include(issue.description)
    end
  end

  describe 'POST create' do
    context 'with correct params' do
      let(:params) do
        {
          issue: {
            title: 'Some issue',
            description: 'dolorem ipsum'
          }
        }
      end

      it 'creates an issue' do
        expect { post '/issues', params: params }
          .to change(Issue, :count).by(1)
        expect(response).to redirect_to(Issue.last)
      end
    end

    context 'with missing params' do
      let(:params) do
        {
          issue: {
            description: 'dolorem ipsum'
          }
        }
      end

      it 'does not create an issue' do
        expect { post '/issues', params: params }
          .not_to change(Issue, :count)
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PUT update' do
    let!(:issue) { create(:issue) }
    let(:params) do
      {
        issue: {
          title: 'Some issue',
          description: 'dolorem ipsum'
        }
      }
    end

    it 'updates the issue' do
      put "/issues/#{issue.id}", params: params

      expect(response).to redirect_to(issue)

      issue.reload
      expect(issue.title).to eq('Some issue')
      expect(issue.description).to eq('dolorem ipsum')
    end
  end

  describe 'DELETE destroy' do
    let!(:issue) { create(:issue) }

    it 'abandons the issue' do
      delete "/issues/#{issue.id}"

      expect(response).to be_successful

      issue.reload
      expect(issue.status).to eq('closed')
    end
  end
end
