# -*- encoding: utf-8 -*-

class ItemsController < ApplicationController

  before_filter :list_items, only: [:create]
  before_filter :load_item, only: [:edit, :update, :destroy]

  respond_to :js

  def edit; end

  def create
    build_item and save_item
  end

  def update
    build_item and save_item if @item.present?
  end

  def destroy
    destroy_item
  end

  private

  def build_item
    @item ||= item_scope.build
    @item.attributes = params[:item] || {}
  end

  def load_item
    @item ||= item_scope.find(params[:id])
  end

  def save_item
    unless @item.save
      flash.now[:error] = error_messages
    end
  end

  def destroy_item
    @item.destroy if @item.present?
  end

  def item_scope
    Item.scoped
  end

  def error_messages
    @item.errors.full_messages.join('<br />')
  end
end
