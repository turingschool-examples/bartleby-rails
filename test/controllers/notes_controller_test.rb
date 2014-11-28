require 'test_helper'
require 'pry'

class NotesControllerTest < ActionController::TestCase
  test "controller responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index records exist under note root" do
    get :index, format: :json
    response_body = JSON.parse(response.body)
    assert response_body["note"]
    assert_equal 1, response_body.keys.count
  end

  test "index returns an array of records" do
    get :index, format: :json
    response_body = JSON.parse(response.body)
    assert_kind_of Array, response_body["note"]
  end

  test "api can get a single note" do
    note = Note.last
    get :show, format: :json, id: note.id
    response_body = JSON.parse(response.body)
    assert response_body["note"]
    assert_equal note.title, response_body["note"]['title']
    assert_equal note.body, response_body["note"]['body']
  end

  test "creating a note through the api" do
    note = { id: 2, title: "New Note", body: "Something" }
    number_of_notes = Note.all.count
    post :create, note: note, format: :json
    response_body = JSON.parse(response.body)
    assert response_body["note"]
    assert_equal number_of_notes + 1, Note.all.count
  end

  test "updating a note through the api" do
    note = Note.last
    updated_content = { id: note.id, title: "Updated Note", body: "Something" }
    put :update, id: note.id, note: updated_content, format: :json
    note.reload
    assert_equal "Updated Note", note.title
  end
end