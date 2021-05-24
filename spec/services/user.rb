class ApiUser
  include HTTParty
  base_uri "http://127.0.0.1:5000/"
  headers "Content-Type" => "application/json"

  def self.create(user)
    post("/cadastro", body: user.to_json)
  end

  def self.auth(user)
    post("/login", body: user.to_json)
  end

  def self.logout(token)
    post("/logout", :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.find_users(user_id)
    get("/usuarios/#{user_id}")
  end

  def self.delete_users(user_id, token)
    delete("/usuarios/#{user_id}", :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.token(user_email, user_pass)
    result = post("/auth/authenticate", body: { email: user_email, password: user_pass }.to_json)
    "#{result.parsed_response["token"]}"
  end
end
