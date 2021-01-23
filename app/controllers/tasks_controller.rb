class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks  = current_user.tasks.order(state: "DESC").order(limit_date: "ASC")
    @status = ['新規', '対応中', '完了']  
  end
  def create
    task = Task.new
    task.task         = params[:task]
    task.state        = params[:state]
    task.limit_date   = params[:limit_date]
    task.description  = params[:description]
    task.user_id      = current_user.id
    task.save
    redirect_to '/tasks', notice: 'タスクを作成しました。'
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
end