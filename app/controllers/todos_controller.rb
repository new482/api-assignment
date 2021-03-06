class TodosController < ApplicationController

  # GET /todos
  # GET /todos.json
  def index
    todos = Todo.all

    respond_to do |format|
      format.html { render :json => todos }
      format.json { render :json => todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    begin
      todo = Todo.find(params[:id])
      result = todo
      status = 200
    rescue => ex
      result = { notice: 'There is no task ID #' + params[:id] }
      status = 204
    end

    respond_to do |format|
      format.html { render :json => result, :status => status }
      format.json { render :json => result, :status => status }
    end
  end

  # POST /todos
  # POST /todos.json
  def create
    begin
      if todo_params[:subject] != '' && (todo_params[:status] == 'pending' || todo_params[:status] == 'done')
        todo = Todo.new(todo_params)

        if todo.content.nil?
          todo.content = ''
        end

        todo.save
        result = { notice: 'A Todo task ID #' + todo.id.to_s + ' has been created.' }
        status = 201
      else
        result = {
          notice: 'Cannot create!!', 
          message: "Please define the subject, and status must be 'pending' or 'done'." 
        }

        status = 400
      end
    rescue => ex
      result = {
        notice: 'Cannot create!!',  
        message: "The subject cannot be null." 
      }

      status = 400
    end

    respond_to do |format|
      format.html { render :json => result, :status => status }
      format.json { render :json => result, :status => status }
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    begin
      todo = Todo.find(params[:id])

      if todo_params[:subject] != '' && (todo_params[:status] == 'pending' || todo_params[:status] == 'done' || todo_params[:status].nil?)
        todo.update_attributes(todo_params)
        result = { notice: 'Successfully updated.' }
        status = 200
      else
        result = {
          notice: 'Cannot update!!', 
          message: "Please define the subject, and status must be 'pending' or 'done'." 
        }

        status = 400
      end
    rescue => ex
      result = {
        notice: 'Cannot update!!'
      }

      status = 400
    end

    respond_to do |format|
      format.html { render :json => result, :status => status }
      format.json { render :json => result, :status => status }
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    begin 
      todo = Todo.find(params[:id])
      todo.destroy
      result = { notice: 'Successfully deleted.' }
      status = 200
    rescue => ex
      result = { notice: 'The task cannot be deleted!!' }
      staus = 400
    end
    
    respond_to do |format|
      format.html { render :json => result, :status => status }
      format.json { render :json => result, :status => status }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:subject, :content, :status)
    end
end
