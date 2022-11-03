module Api
  class Api::ItemsController < ApplicationController
    def index
      items = Item.order(created_at: :desc)
      render json: { status: 'OK', data: items }
    end

    def create
      items = Item.new({name: params[:name], price: params[:price]})
      items.save
      render json: { status: 'OK' }
    end
  end
end