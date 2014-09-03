require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	let :valid_attributes do
		{
			first_name: 'Zach'
		}
	end
	describe "GET #index" do
		let :user1 do
			User.create! valid_attributes
		end
		let :user2 do
			User.create! valid_attributes
		end

		before do
			get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @users to be all users" do
			expect(assigns(:users)).to include(user1, user2)
		end

	end

	describe "GET show" do
		before do
		  @user = User.create! valid_attributes
		  get :show, id: @user.id
		end

		it "should render the index template" do
		  expect(response).to render_template :show
		end

		it "should succeed" do
		  expect(response).to be_success
		end

		it "should assign users to all users" do
			expect(assigns(:user)).to eq(@user)
		end
	end


	describe "Get new" do
		before do
			get :new
		end

		it "should render new template successfully " do
			expect(response).to render_template :new
			expect(response).to be_success
		end

		it "should make user a new User" do
			expect(assigns(:user)).to be_a(User)
			expect(assigns(:user)).to_not be_persisted
		end
	
	end 

	describe "POST create" do
			
		describe " a successful create " do
			it "should create a user in the DB" do
				expect do
					post :create, user: valid_attributes
				end.to change(User, :count).by(1)
		 	end
		end
	end

	describe "Get edit" do
		before do
			@test_user = User.create! valid_attributes
			get :edit, id: @test_user.id
		end

		it "should render the edit template" do
		  expect(response).to render_template :edit
		  expect(response).to be_success
		end

		it "should assign the user " do
			expect(assigns(:user)).to eq(@test_user)
		end
	end

	describe "put/patch update" do
		before do
      		@test_user = User.create! valid_attributes
    	end
    end

    describe "with successful update" do
      let :new_attributes do
        {
          :first_name => "Peter"
        }
      end

      before do
        patch :update, user_id: @test_user.user_id,
        user: new_attributes
      end

      # it "should update the user record in the database" do
      #   expect(@test_user.reload.user_id).to be "Peter"
      # end

      # it "should redirect to the index of all users" do
      #   expect(response).to redirect_to users_path
      # end
    end

end
