class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render :action => "edit"
    end
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

  def back
    @project = Project.find(params[:id])
    back = Back.new
    back.project = Project.find(params[:id])
    back.user = User.find(1)
    back.amount = 100
    if back.save
      redirect_to @project
    else
      render :action => "show"
    end
  end
end
