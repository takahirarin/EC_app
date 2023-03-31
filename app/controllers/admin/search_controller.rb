class Admin::SearchController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
    render "admin/items/index"
  end
end
