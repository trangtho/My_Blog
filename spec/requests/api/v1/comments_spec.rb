require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('list comments') do
      tags 'Comments'
      response(200, 'successful') do
        let(:post_id) { '123' }

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

    post('create comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:post_id) { '123' }
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            content: { type: :string }
          }
                                             },
                  required: ['content']
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

  path '/api/v1/posts/{post_id}/comments/new' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('new comment') do
      response(200, 'successful') do
        let(:post_id) { '123' }

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

  path '/api/v1/posts/{post_id}/comments/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit comment') do
      response(200, 'successful') do
        let(:post_id) { '123' }
        let(:id) { '123' }

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

  path '/api/v1/posts/{post_id}/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show comment') do
      response(200, 'successful') do
        let(:post_id) { '123' }
        let(:id) { '123' }

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

    put('update comment') do
      response(200, 'successful') do
        let(:post_id) { '123' }
        let(:id) { '123' }

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

    delete('delete comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:post_id) { '123' }
        let(:id) { '123' }

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
