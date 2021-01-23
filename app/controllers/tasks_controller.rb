class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks  = current_user.tasks.order(state: "DESC").order(limit_date: "ASC")
    @status = ['新規', '対応中', '完了']  
  end
  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to @task, notice: 'タスクを作成しました。'
    # task = Task.new
    # task.task         = params[:task]
    # task.state        = params[:state]
    # task.limit_date   = params[:limit_date]
    # task.description  = params[:description]
    # task.user_id      = current_user.id
    # task.save
    # redirect_to '/tasks', notice: 'タスクを作成しました。'
  end
  def show
    id      = params[:id]
    @task   = Task.find(id)
    @status = ['新規', '対応中', '完了']  
  end
  def update
    task = Task.find(params[:id])  
    task.task         = params[:task]
    task.state        = params[:state]
    task.limit_date   = params[:limit_date]
    task.description  = params[:description]
    task.save

    redirect_to '/tasks', notice: 'タスクを更新しました。'
  end
  def destroy
    task       = Task.find(params[:id])
    task.destroy
    redirect_to '/tasks', notice: 'タスクを削除しました。'
  end
  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end
  def task_params
    params.require(:task).permit(:task, :limit_date, :state, :description)
  end
end