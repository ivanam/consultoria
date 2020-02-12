class TodosController < ApplicationController
before_action :set_todo, only: [:show, :update, :destroy]
#GET /todos
def index  
    @todos = Todo.all
end# GET /todos/1

def show
end

def create  
    @todo = Todo.new(todo_params)  
    if @todo.save    
      render :show, status: :created, location: @todo  
    else    
      render json: @todo.errors, status: :unprocessable_entity  
    end
end

def update  
    if @todo.update(todo_params)    
       render :show, status: :ok, location: @todo  
    else    
        render json: @todo.errors, status: :unprocessable_entity  
    end
end 
def destroy  
    @todo.destroy
end

private 
    def set_todo    
      @todo = Todo.find(params[:id])  
    end  
    def todo_params    
      params.require(:todo).permit(:title, :description, :finished)  
    end
end
