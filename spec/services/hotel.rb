class ApiHotel
  include HTTParty
  base_uri "http://127.0.0.1:5000/"
  headers "Content-Type" => "application/json"

  def self.create_hotel(hotel_id, hotel, token)
    post("/hoteis/#{hotel_id}", body: hotel.to_json, :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.update_hotel(hotel_id, hotel, token)
    put("/hoteis/#{hotel_id}", body: hotel.to_json, :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.find_hotel(hotel_id)
    get("/hoteis/#{hotel_id}")
  end

  def self.delete_hotel(hotel_id, token)
    delete("/hoteis/#{hotel_id}", :headers => { "Authorization" => "Bearer #{token}" })
  end
end
