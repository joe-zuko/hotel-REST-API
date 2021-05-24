describe "search an user" do
  context "when I find an user" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.find_users(user.id) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong id number" do
    let(:result) { ApiUser.find_users(1500000) }

    it { expect(result.response.code).to eql "404" }
    it { expect(result.parsed_response["message"]).to eql "User not found." }
  end
end
