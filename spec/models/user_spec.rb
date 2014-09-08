# context 'creating a new user' do

#       it 'should add one user' do
#         lambda {
#           post '/api/users.json', :user => {:name => 'Charlie', :login => 'charlie'}
#         }.should change(User, :count).by(1)
#       end

#       context 'after creating, the new user' do

#         before do
#           post '/api/users.json', :user => {:name => 'Charlie', :login => 'charlie'}
#           @user = User.last
#         end

#         subject { JSON.parse(response.body) }

#         it 'should have the correct name and login' do
#           @user.name.should == 'Charlie'
#           @user.login.should == 'charlie'
#         end

#         it 'should be returned' do
#           should == {'login' => 'charlie', 'name' => 'Charlie'}
#         end

#       end

#     end