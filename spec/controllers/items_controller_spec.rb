# -*- encoding: utf-8 -*-

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  render_views

  let!(:item) { FactoryGirl.create(:item) }

  describe 'on GET to :edit' do
    context 'when valid item' do
      before { get :edit, id: item.id, format: :js }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'renders templates' do
        expect(response).to render_template('items/_form')
        expect(response).to render_template('items/edit')
        expect(response).not_to render_template('layouts/application')
      end

      it 'returns form' do
        expect(response.body).to include("/items/#{item.id}")
        expect(response.body).to include(item.name)
        expect(response.body).to include('Заменить картинку')
        expect(response.body).to include('Отменить редактирование')
      end
    end

    context 'when invalid item' do
      it 'responds with 404' do
        expect { get :edit, id: 0, format: :js }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'on PUT to :update' do
    context 'when valid item with file' do
      before {
        put :update,
            item: {
                name: 'New changed name',
                picture: fixture_file_upload('/pictures/test-image-01.png', 'image/png')
            },
            id: item.id,
            format: :js
      }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'changes item.name' do
        expect(item.reload.name).to eq('New changed name')
      end

      it 'changes item.picture' do
        expect(item.reload.picture_file_name).to eq('test-image-01.png')
      end

      it 'renders templates' do
        expect(response).to render_template('items/update')
        expect(response).to render_template('items/_item')
      end
    end

    context 'when valid item without file' do
      before {
        put :update,
            item: {
                name: 'New changed name'
            },
            id: item.id,
            format: :js
      }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'changes item.name' do
        expect(item.reload.name).to eq('New changed name')
      end

      it 'returns original item.picture' do
        expect(item.reload.picture_file_name).to eq('test-image.jpg')
      end

      it 'renders templates' do
        expect(response).to render_template('items/update')
        expect(response).to render_template('items/_item')
      end
    end

    context 'when invalid item' do
      it 'responds with 404' do
        expect { get :edit, id: 0, format: :js }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'on DELETE to :destroy' do
    context 'when valid item' do
      before { delete :destroy, id: item.id, format: :js }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'renders templates' do
        expect(response).to render_template('items/destroy')
      end

      it 'removes item' do
        expect { item.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'when invalid item' do
      it 'responds with 404' do
        expect { get :edit, id: 0, format: :js }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
