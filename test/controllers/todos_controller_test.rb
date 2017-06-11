require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest

  test "Create a task to the list" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    assert_equal 201, status
  end

  test "Can create a task to the list (conent is empty)" do
    post '/todos.json', params: { todo: { content: "", status: "pending", subject: 'subject' } }
    assert_equal 201, status
  end

  test "Shouldn't create a task (subject = null)" do
    post '/todos.json', params: { todo: { content: "content", status: "pending" } }
    assert_equal 400, status
  end

  test "Shouldn't create a task (subject is empty)" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: "" } }
    assert_equal 400, status
  end

  test "Shouldn't create a task (status != pending || status != done)" do
    post '/todos.json', params: { todo: { content: "content", status: "", subject: 'subject' } }
    assert_equal 400, status
  end

  test "View all items of the task" do
    get todos_path
    assert_equal 200, status
  end

  test "View a single task in the list" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    get todo_path(Todo.last)
    assert_equal 200, status
  end

  test "Cannot view a single task in the list if there is none" do
    get todo_path(111)
    assert_equal 204, status
  end

  test "Edit existing task" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    put todo_url(Todo.last), params: { todo: { content: "Update content", status: "pending", subject: 'Update Subject' } }
    assert_equal 200, status
  end

  test "Set the task status" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    put todo_url(Todo.last), params: { todo: { content: "content", status: "done", subject: 'subject' } }
    assert_equal 200, status
  end

  test "Shouldn't edit existing task (subject is empty)" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    put todo_url(Todo.last), params: { todo: { content: "Update content", status: "done", subject: '' } }
    assert_equal 400, status
  end

  test "Shouldn't edit existing task (status is empty)" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    put todo_url(Todo.last), params: { todo: { content: "Update content", status: "", subject: 'Update Subject' } }
    assert_equal 400, status
  end

  test "Delete a task from the list" do
    post '/todos.json', params: { todo: { content: "content", status: "pending", subject: 'subject' } }
    assert_difference('Todo.count', -1) do
      delete todo_url(Todo.last)
    end
  end
end
