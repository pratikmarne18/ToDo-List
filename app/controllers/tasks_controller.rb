class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    
    # @tasks = Task.all
    if current_user.is_admin?
      @tasks = Task.where(project_id:params[:id])
    else
      @project_user = ProjectUser.find_by(project_id:params[:id],user_id:current_user.id)
      @tasks = Task.where(project_user_id:@project_user.id)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    # @user = params[:user_id]
    @project = params[:id]
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    
      if @task.save
        # format.html { redirect_to @task, notice: 'Task was successfully created.' }
        # format.json { render :index, status: :created, location: @task }
        redirect_to tasks_path(id:task_params["project_id"])
      else
        render 'new'
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
layout 'application'
  def add_developer
    @project = Project.find_by_id(params[:id])
    @task = Task.find_by_id(params[:task_id])
    # p ")))))))))))))))))))))))))))))))))))))))))))))))"
    # p @projects = ProjectUser.where(project_id:@project.id)
  end
  
   def save_developer
     p "***********************************************"
     p params["add_developer"]["project_id"]
     p params["add_developer"]["user_id"]
     @task=Task.find_by_id(params["add_developer"]["task_id"])
     @project_user = ProjectUser.create(user_id:params["add_developer"]["user_id"],project_id:params["add_developer"]["project_id"])
     @task.update_attributes(project_user_id:@project_user.id)
     redirect_to tasks_path(:id => @task.project_id)
   end
   
   def view_task
     @tasks = Task.where("project_user_id=?",params[:project_user_id])
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :user_id, :project_user_id, :project_id, :status)
    end
end
