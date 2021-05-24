describe "get site" do
  context "when I search all sites" do
    let(:result) { ApiSite.find_all_sites() }

    it { expect(result.response.code).to eql "200" }
  end

  context "when I search a site" do
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:result) { ApiSite.find_sites(site["url"]) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when site not found" do
    let(:result) { ApiSite.find_sites("xpto") }

    it { expect(result.response.code).to eql "404" }
    it { expect(result.parsed_response["message"]).to eql "Site not found." }
  end
end
