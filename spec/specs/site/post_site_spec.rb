describe "post new site" do
  context "when new site" do
    let(:result) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }

    it { expect(result.response.code).to eql "200" }
  end

  context "when same id" do
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:result) { ApiSite.create_sites(site["url"]) }

    it { expect(result.response.code).to eql "400" }
  end
end
