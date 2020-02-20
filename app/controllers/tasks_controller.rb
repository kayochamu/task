class TasksController < ApplicationController

  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy )
  
  
  def index
    @task = @user.tasks.find_by(params[:user_id])
    @tasks = @user.tasks
  end

  def show
     @task = @user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

  def edit
    
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url 
  end
  
  private

    def task_params
      params.require(:task).permit(:name, :content)
    end
    
    def set_user
      @user = User.find(1)
    end

    def set_task
      unless @task = @user.tasks.find_by(params[:user_id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end
end


 
  
