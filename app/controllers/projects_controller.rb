class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user = User.find(1)
    if @project.save
      redirect_to @project
    else
      render :action => "new"
    end
  end
end
