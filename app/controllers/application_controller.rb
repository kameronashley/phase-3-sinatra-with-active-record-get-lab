class ApplicationController < Sinatra::Base
  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all
    baked_goods_by_price = baked_goods.order(price: :desc)
    baked_goods_by_price.to_json(only: [:name, :price])
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all
    most_expensive = baked_goods.order(price: :desc)
    most_expensive.first.to_json(only: [:name, :price])
  end

end
