class TodosController < ApplicationController

    def index 
        render json: Todo.all
    end 

    def create 
        todo = Todo.new(todo_params)
        if todo.save 
            render json: todo
        else
            render json: {error: "There is an error"}
        end 
    end 

    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        render json: {message: "Deleted #{todo.content} Successfully !"}
    end 


    def update 
        todo = Todo.find(params[:id])
        todo.update(todo_params)
        render json: todo
    end 





    private 
    def todo_params 
        params.require(:todo).permit(:content)
    end
    
end 

