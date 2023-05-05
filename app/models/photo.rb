require 'flickr'

class Photo < ApplicationRecord
  def self.fetch(user_id)
  	key = ENV['FLICKR_API_KEY']
  	secret = ENV['FLICKR_API_KEY']
  	flickr = Flickr.new(key, secret)
  	json_data = flickr.photos.search(:user_id => user_id)
  end
end
