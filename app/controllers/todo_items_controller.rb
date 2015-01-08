class TodoItemsController < ApplicationController
  def index
    @todo_items = TodoItem.all
  end

  def create
    # The line below shows what params look like
    #render plain: params[:todo_item].inspect
    # Remember, we need to permit title because of strong parameters.
    @todo_item = TodoItem.create(todo_item_params)
  end

  def update
    item = TodoItem.find params[:id]
    item.update_attributes todo_item_params 
    render nothing: true
  end

  private
  # method to permit parameter for todo_item
  def todo_item_params
    params.require(:todo_item).permit(:title, :completed)
  end
end
