class Link < ActiveRecord::Base
  belongs_to :user

  def send_to_hot_links
    conn = Faraday.new(:url => 'https://calawayhotreads.herokuapp.com') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
    params = {read: {url: url}}
    response = conn.post '/reads', params
  end
end
