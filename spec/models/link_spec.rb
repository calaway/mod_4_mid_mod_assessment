require 'rails_helper'

RSpec.describe Link, type: :model do
  it "#send_to_hot_links" do
    link = Link.create(title: "The Big Idea", url: "www.example.com/9")

    response = link.send_to_hot_links

    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)["url"]).to eq("www.example.com/9")
  end
end
