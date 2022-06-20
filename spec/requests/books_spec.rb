require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe 'GET /books' do
    before do
      FactoryBot.create(:book, title: "1984", author: "George Orwell")
      FactoryBot.create(:book, title: "The time machine", author: "H.G Wells")
    end

    it "returns all books" do
      get ('http://localhost:3000/api/v1/books')
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /books' do
    it 'creates a new book' do
      expect {
        post ('http://localhost:3000/api/v1/books'), params: { book: { title: 'The Martian', author: 'Andy Weir' }}
    }.to change { Book.count }.from(1).to(2)

    expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /books/:id' do
    let!(:book) { FactoryBot.create(:book, title: "1984", author: "George Orwell")}

    it 'deletes a book' do
      expect {
        delete ("http://localhost:3000/api/v1/books/#{book.id}")
    }.to change { Book.count }.from(2).to(1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
