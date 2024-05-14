require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  path '/api/v1/posts' do

    get('list posts') do
      tags 'Posts'
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

    post('create post') do
      tags 'Posts'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            content: { type: :string },
            category_ids: { type: :array, items: {
              type: :integer
            } }
          },
          required: ['title', 'content', 'category_ids']
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

  path '/api/v1/posts/new' do

    get('new post') do
      tags 'Posts'
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

  path '/api/v1/posts/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit post') do
      tags 'Posts'
      response(200, 'successful') do
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

  path '/api/v1/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      tags 'Posts'
      response(200, 'successful') do
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

    put('update post') do
      tags 'Posts'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            content: { type: :string },
            category_ids: { type: :array, items: {
              type: :integer
            } }
          },
          required: ['title', 'content', 'category_ids']
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

    delete('delete post') do
      tags 'Posts'
      response(200, 'successful') do
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

  path '/my_posts' do

    get('my_post post') do
      tags 'Posts'
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
