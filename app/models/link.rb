class Link < ActiveRecord::Base
  belongs_to :user

  def send_to_hot_links
    conn = Faraday.new(:url => 'https://calawayhotreads.herokuapp.com') do |faraday|
    # conn = Faraday.new(:url => 'http://0.0.0.0:3001/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST       faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    params = {read: {url: url}}

    response = conn.post '/reads', params
  end
end
