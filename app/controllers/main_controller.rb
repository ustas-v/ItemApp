# -*- encoding: utf-8 -*-

class MainController < ApplicationController

  before_filter :build_item, only: :index
  before_filter :list_items, only: :index

  def index; end

  private

  def build_item
    @item = Item.new
  end

end
