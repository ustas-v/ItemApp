# -*- encoding: utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def list_items
    @items ||= Item.ordered
  end
end
