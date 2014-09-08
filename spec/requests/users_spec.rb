describe "Users" do
  describe "get user's name" do
  describe "GET /users" do
    it "returns the user's name" do
      FactoryGirl.create :user, name: "Steve"
      FactoryGirl.create :user, name: "Sam"

      get "/users", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      user_names = body.map { |u| u["user"] }

      expect(user_names).to match_array(["Steve",
                                           "Sam"])
    end
  end

end  

  # describe "GET /movies/:id" do
  #   it "returns a requested movie" do
  #     m = FactoryGirl.create :movie, title: "2001: A Space Odyssy"

  #     get "/movies/#{m.id}", {}, { "Accept" => "application/json" }

  #     expect(response.status).to be 200

  #     body = JSON.parse(response.body)
  #     expect(body["title"]).to eq "2001: A Space Odyssy"
  #   end
  # end

  # describe "PUT /movies/:id" do
  #   it "updates a movie" do
  #     m = FactoryGirl.create :movie, title: "Star Battles"

  #     movie_params = {
  #       "movie" => {
  #         "title" => "Star Wars"
  #       }
  #     }.to_json

  #     request_headers = {
  #       "Accept" => "application/json",
  #       "Content-Type" => "application/json"
  #     }

  #     put "/movies/#{m.id}", movie_params, request_headers

  #     expect(response.status).to be 204
  #     expect(m.reload.title).to eq "Star Wars"
  #   end
  # end

  # describe "POST /movies" do
  #   it "creates a movie" do
  #     movie_params = {
  #       "movie" => {
  #         "title" => "Indiana Jones and the Temple of Doom"
  #       }
  #     }.to_json

  #     request_headers = {
  #       "Accept" => "application/json",
  #       "Content-Type" => "application/json"
  #     }

  #     post "/movies", movie_params, request_headers

  #     expect(response.status).to eq 201
  #     expect(Movie.first.title).to eq "Indiana Jones and the Temple of Doom"
  #   end
  # end

  # describe "DELETE /movies/:id" do
  #   it "deletes a movie" do
  #     m = FactoryGirl.create :movie, title: "The Shining"

  #     delete "/movies/#{m.id}", {}, { "Accept" => "application/json" }

  #     expect(response.status).to be 204
  #     expect(Movie.count).to eq 0
  #   end
  # end
end