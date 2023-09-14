class Api::V1::HistoriesController < ApplicationController

  def index
    shop_view_history = ShopViewHistory.order(count: :desc)
    shop_ids_arry = shop_view_history.pluck(:shop_id)
    shop_ids = shop_ids_arry.join(',')
    client = HTTPClient.new
    uri = URI.parse("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['API_KEY']}&id=#{shop_ids}&format=json")
    response  = client.get(uri)
    res_json  = JSON.parse(response.body)
    @results = res_json['results']['shop']
    render json: @results
  end
end