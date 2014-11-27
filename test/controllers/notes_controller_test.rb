require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "responds to json" do
    get :index, { format: :json }
    assert_response :success
  end

  test "index records exist under note root" do
    get :index, { format: :json }
    response_body = JSON.parse(response.body)
    assert response_body["note"]
    assert_equal 1, response_body.keys.count
  end

  test "index returns an array of records" do
    get :index, { format: :json }
    response_body = JSON.parse(response.body)
    assert_kind_of Array, response_body["note"]
  end
end
