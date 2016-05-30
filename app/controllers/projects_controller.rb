class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!

  def index
    if current_user.is_admin?
    @projects = Project.all
    else
      @projects = current_user.projects
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    # respond_to do |format|
      if @project.save
        # format.html { redirect_to @project, notice: 'Project was successfully created.' }
        # format.json { render :index, status: :created, location: @project }
        redirect_to projects_path
      else
        # format.html { render :new }
        # format.json { render json: @project.errors, status: :unprocessable_entity }
        render 'new'
      
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def developer_todolist
    p "ppppppppppppppppppppppppppppppppppppppppppppppppp"
    p @project = Project.find_by_id(params[:id])
    p @todo_lists = Task.where(project_id:@project.id)
    @progress = @todo_lists.where(:status=>"progress")
    @pending = @todo_lists.where(:status=>"pending")
    @done = @todo_lists.where(:status=>"done")
    p @developers = ProjectUser.where(project_id:@project.id)
  end
  
  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
