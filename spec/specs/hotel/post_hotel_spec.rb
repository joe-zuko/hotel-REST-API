describe "create a new hotel" do
  context "when new hotel" do
    let(:user) { build(:registred_user) }
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:result) { ApiHotel.create_hotel(Faker::Name.first_name, build(:new_hotel, site_id: site["site_id"]).to_hash, user.token) }

    it { expect(result.response.code).to eql "201" }
  end

  context "when hotel exist" do
    let(:user) { build(:registred_user) }
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:hotel_id) { Faker::Name.first_name }
    let(:old_hotel) { ApiHotel.create_hotel(hotel_id, build(:new_hotel, site_id: site["site_id"]).to_hash, user.token) }
    let(:id_old) { old_hotel["hotel_id"] }
    let(:result) { ApiHotel.create_hotel(id_old, build(:new_hotel, site_id: site["site_id"]).to_hash, user.token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["message"]).to end_with "exists." }
  end

  context "when site does not exist" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiHotel.create_hotel(Faker::Name.first_name, build(:new_hotel, site_id: 0).to_hash, user.token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["message"]).to eql "The hotel must be associated to a valid site id." }
  end
end
