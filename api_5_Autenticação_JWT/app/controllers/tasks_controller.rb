#app/controllers/tasks_controller.rb

require_relative 'c:\Users\JOAO PEDRO\API_de_Autenticação_JWT\authenticator.rb'

class TasksController < ApplicationController
     include Authenticator

     #autenticação do usuário e geração de token JWT
     def authenticate_user
          username = params[:usename]
          password = params[:password]

          token = authenticate(username, password)

          if token
               render json: { token: token}
          else
               render json: { error: 'Autenticação falhou'}, status: :unauthorized
          end
     end
end
