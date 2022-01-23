class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # Get /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  #Post /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

   # PUT /todos/:id
   def update
     @todo.update(todo_params)
   end

    # DELETE /todos/:id
    def destroy
      @todo.destroy
    end

    private

    def todo_params
      #whitelist params
      params.permit(:title, :created_by)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
end
