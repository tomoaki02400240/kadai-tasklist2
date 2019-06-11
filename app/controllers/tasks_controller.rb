class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  def index
    @tasks = Task.all.page(params[:page]).per(5)
  end

  def show
  end

  def new 
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
       flash[:success] = 'タスク完了'
       redirect_to @task
    else 
       flash.now[:danger] = 'タスク失敗'
     render :new
    end
  end
  def edit
  end
  def update
     if @task.update(task_params)
         flash[:success] = '編集しました'
         redirect_to @task
     else
         flash.now[:danger] = '編集に失敗しました'
         render :edit
     end
  end
  def destroy
     @task.destroy
     
     flash[:success] = 'タスクは正常に削除されました'
     redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
     params.require(:task).permit(:content,:status)
  end
end