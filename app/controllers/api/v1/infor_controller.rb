class Api::V1::InforController < ApplicationController
  def index
    latitude_portal_code = params[:latitude]
    longitude_portal_code = params[:longitude]
    range = params[:range].to_i
    unless latitude_portal_code[0] == "<"
      client = HTTPClient.new
      uri = URI.parse("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=b962ff47028e0d11&lat=#{latitude_portal_code}&lng=#{longitude_portal_code}&range=#{range}&count=100&format=json")

      response  = client.get(uri)
      res_json  = JSON.parse(response.body)
      @results = res_json['results']['shop']
      render json: @results
    else
      @error = "位置情報を取得し直してください"
      puts "APIリクエストエラー"
    end
  end

  def show
    id = params[:id]
    client = HTTPClient.new
    uri = URI.parse("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=b962ff47028e0d11&id=#{id}&format=json")
    response  = client.get(uri)
    res_json  = JSON.parse(response.body)
    @results = res_json['results']['shop'][0]

    shop_view_history = ShopViewHistory.find_by(shop_id: id)

    if shop_view_history.nil?
      ShopViewHistory.create(shop_id: id, count: 0)
    else
      shop_view_history.increment!(:count, 1)
    end
    render json: @results
  end
end
