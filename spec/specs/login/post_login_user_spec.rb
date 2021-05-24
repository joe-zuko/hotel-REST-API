describe "post login user" do
  context "when successful login" do
    let(:user) { build(:registred_user) }
    let(:result) { ApiUser.auth(user.to_hash) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong password" do
    let(:result) { ApiUser.auth(build(:wrong_password_user_auth).to_hash) }

    it { expect(result.response.code).to eql "401" }
    it { expect(result.parsed_response["message"]).to eql "The username or password is incorrect." }
  end

  context "when empty password" do
    let(:result) { ApiUser.auth(build(:empty_password_user_auth).to_hash) }

    it { expect(result.response.code).to eql "401" }
    it { expect(result.parsed_response["message"]).to eql "The username or password is incorrect." }
  end

  context "when wrong login" do
    let(:result) { ApiUser.auth(build(:wrong_login_user_auth).to_hash) }

    it { expect(result.response.code).to eql "401" }
    it { expect(result.parsed_response["message"]).to eql "The username or password is incorrect." }
  end

  context "when empty login" do
    let(:result) { ApiUser.auth(build(:empty_login_user_auth).to_hash) }

    it { expect(result.response.code).to eql "401" }
    it { expect(result.parsed_response["message"]).to eql "The username or password is incorrect." }
  end
end
