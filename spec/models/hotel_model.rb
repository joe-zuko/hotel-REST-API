class HotelModel
  attr_accessor :nome, :estrelas, :diaria, :cidade, :site_id

  def to_hash
    {
      nome: @nome,
      estrelas: @estrelas,
      diaria: @diaria,
      cidade: @cidade,
      site_id: @site_id,
    }
  end
end
