describe "get a hotel" do
  context "when I find a Hotel" do
    let(:user) { build(:registred_user) }
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:hotel) { ApiHotel.create_hotel(Faker::Name.first_name, build(:new_hotel, site_id: site["site_id"]).to_hash, user.token) }
    let(:result) { ApiHotel.find_hotel(hotel["hotel_id"]) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when I use a wrong ID" do
    let(:result) { ApiHotel.find_hotel(0) }

    it { expect(result.response.code).to eql "404" }
    it { expect(result.parsed_response["message"]).to eql "Hotel not found." }
  end
end
