describe "delete an user" do
  context "when I delete an user" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.delete_users(user.id, user.token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong id number" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.delete_users(150000000000000, user.token) }

    it { expect(result.parsed_response["message"]).to eql "User not found." }
    it { expect(result.response.code).to eql "404" }
  end

  context "when wrong token" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.delete_users(user.id, "wrongtoken") }

    it { expect(result.response.code).to eql "422" }
  end
end
