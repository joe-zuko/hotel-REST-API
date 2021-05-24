describe "post logout user" do
  context "when logout an user" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.logout(user.token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong token" do
    let(:user) { build(:user) }
    let(:result) { ApiUser.logout("wrongtoken") }

    it { expect(result.response.code).to eql "422" }
  end
end
