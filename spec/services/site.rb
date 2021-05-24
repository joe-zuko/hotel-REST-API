class ApiSite
  include HTTParty
  base_uri "http://127.0.0.1:5000/"
  headers "Content-Type" => "application/json"

  def self.find_all_sites()
    get("/sites")
  end

  def self.find_sites(site_id)
    get("/sites/#{site_id}")
  end

  def self.create_sites(site_id)
    post("/sites/#{site_id}")
  end

  def self.remove_sites(site_id)
    delete("/sites/#{site_id}")
  end
end
