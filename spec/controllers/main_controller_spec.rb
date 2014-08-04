# -*- encoding: utf-8 -*-

require 'rails_helper'

RSpec.describe MainController, type: :controller do
  render_views

  let!(:item) { FactoryGirl.create(:item) }

  describe 'on GET to :index' do
    before { get :index }

    context 'when exists items' do
      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'renders templates' do
        expect(response).to render_template('main/index')
        expect(response).to render_template('items/_form')
        expect(response).to render_template('items/_list-items')
        expect(response).to render_template('items/_item')
        expect(response).to render_template('layouts/application')
      end

      it 'shows item' do
        expect(response.body).to include(item.name)
        expect(response.body).to include(item.picture_for_list)
      end
    end

    context 'when does not exists items' do
      let!(:item) { nil }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'renders templates' do
        expect(response).to render_template('main/index')
        expect(response).to render_template('items/_form')
        expect(response).to render_template('items/_list-items')
        expect(response).not_to render_template('items/_item')
        expect(response).to render_template('layouts/application')
      end
    end
  end
end
