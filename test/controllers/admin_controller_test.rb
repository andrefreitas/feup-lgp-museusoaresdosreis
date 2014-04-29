require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "login test" do
    email = "demon@mail.com"
    password = "passdemo"
    Administrator.create(name:"fernando", email: email, password: password)
    get :login, {:format => 'json', :email => email, :password => password}
    assert_equal "ok", JSON.parse(@response.body)['result']
  end
end