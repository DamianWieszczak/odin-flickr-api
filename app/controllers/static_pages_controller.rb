class StaticPagesController < ApplicationController
  require 'flickr'
  
  def index
    flickr = Flickr.new "218d6e4fd60d59c63a6cc327ffd453b2", ENV["flickr_secret"]
    unless params[:user_id].blank?
      @photos = flickr.photos.search(user_id: params[:user_id])
    else
      @photos = flickr.photos.getRecent
    end
  end

end
