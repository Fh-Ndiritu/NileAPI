require 'rails_helper'

RSpec.describe 'Books Api', type: :request do 
    it 'returns all books ' do
        FactoryBot.create(:book, author:'Fh', title: 'Baby Shark')
        FactoryBot.create(:book, author:'Ngugi', title: 'Across the Bridge')

        get '/api/v1/books'
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
        
    end

end