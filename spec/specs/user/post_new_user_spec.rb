describe "post new user" do
  context "when new user" do
    let(:result) { ApiUser.create(build(:new_user).to_hash) }

    it { expect(result.response.code).to eql "201" }
    it { expect(result.parsed_response["message"]).to eql "User created successfully!" }
  end

  context "when null login" do
    let(:result) { ApiUser.create(build(:null_user).to_hash) }

    it { expect(result.response.code).to eql "500" }
  end

  context "when duplicate email" do
    let(:result) { ApiUser.create(build(:registred_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["message"]).to end_with "exists." }
  end

  context "when empty email" do
    let(:result) { ApiUser.create(build(:empty_email_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["message"]).to eql "The field 'email' cannot be left blank." }
  end

  context "when null password" do
    let(:result) { ApiUser.create(build(:null_password_user).to_hash) }

    it { expect(result.response.code).to eql "500" }
  end

  context "when null email" do
    let(:result) { ApiUser.create(build(:null_email_user).to_hash) }

    it { expect(result.parsed_response["message"]).to eql "The field 'email' cannot be left blank." }
    it { expect(result.response.code).to eql "400" }
  end
end
