class UserModel
  attr_accessor :id, :login, :senha, :email, :token

  def to_hash
    {
      login: @login,
      senha: @senha,
      email: @email,
    }
  end
end
