require 'flickr'

class Photo < ApplicationRecord
  def self.fetch(user_id)
  	key = ENV['FLICKR_API_KEY']
  	secret = ENV['FLICKR_SECRET']
  	flickr = Flickr.new(key, secret)

    begin
      flickr.photos.search(:user_id => user_id)      
    rescue StandardError => e
      nil
    end

  end
end