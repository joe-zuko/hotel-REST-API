describe "delete site" do
  context "when delete site" do
    let(:site) { ApiSite.create_sites("www." + Faker::Name.first_name + ".com") }
    let(:result) { ApiSite.remove_sites(site["url"]) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response["message"]).to eql "Site deleted." }
  end

  context "when site not found" do
    let(:result) { ApiSite.remove_sites("xpto") }

    it { expect(result.response.code).to eql "404" }
    it { expect(result.parsed_response["message"]).to eql "Site not found." }
  end
end
