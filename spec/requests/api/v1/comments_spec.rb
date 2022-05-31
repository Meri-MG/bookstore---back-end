require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/books/{book_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'book_id', in: :path, type: :string, description: 'book_id'

    get('list comments') do
      tags 'comments'
      response(200, 'successful') do
        let(:book_id) { '123' }

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
      tags 'comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          comment: { type: :object,
                  properties: {
                    text: { type: :string },
                    book_id: { type: :integer}
                  } }
        },
        required: %w[text book_id]
      }
      response(200, 'successful') do
        let(:book_id) { '123' }

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

  path '/api/v1/books/{book_id}/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'book_id', in: :path, type: :string, description: 'book_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete comment') do
      tags 'comments'
      response(200, 'successful') do
        let(:book_id) { '123' }
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
