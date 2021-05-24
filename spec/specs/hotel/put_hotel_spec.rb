describe "put hotel" do
  context "when modify hotel" do
    before(:all) do
      user = build(:registred_user)
      site = ApiSite.create_sites("www." + Faker::Name.first_name + ".com")
      original_hotel = ApiHotel.create_hotel(Faker::Name.first_name, build(:new_hotel, site_id: site["site_id"]).to_hash, user.token)
      new_hotel = build(:update_hotel, site_id: site["site_id"])
      @result = ApiHotel.update_hotel(original_hotel["hotel_id"], new_hotel.to_hash, user.token)
    end

    it { expect(@result.response.code).to eql "200" }
  end
end
