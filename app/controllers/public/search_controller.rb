class Public::SearchController < ApplicationController
  def search
    genre = Genre.find(params[:id])
    @items = Item.where(genre_id: genre.id)
    redirect_to items_path
  end
end
