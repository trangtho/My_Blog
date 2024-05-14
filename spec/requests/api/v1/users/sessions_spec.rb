require 'swagger_helper'

RSpec.describe 'api/v1/users/sessions', type: :request do

  path '/users/sign_in' do

    post('create session') do
      tags 'Session'

      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string },
            password: { type: :string }
          },
          required: ['username', 'password']
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/sign_out' do

    delete('delete session') do
      tags 'Session'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
