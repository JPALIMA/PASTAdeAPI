require 'jwt'

#Simples banco de dados de usários (substitua por banco de dados real )
USERS = [
  { username: 'usuario1', password: 'senha1'},
  { username: 'usuario2', password: 'senha2'}
]

#Chave secreta para assinar os tokens JWT
SECRET_KEY = 'sua_chave_secreta'

#Método para autenticar um usuário e gerar um token JWT
def authenticate(username, password)
  user = USERS.find { |u| u[:username] == username && u[:password] == password}
  return nill unless user

  payload = { username: username}
  token = JWT.encore(payload, SECRET_KEY, 'HS256')
  token
end
