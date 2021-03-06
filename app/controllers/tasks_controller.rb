class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :toggle, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    tasks_done = Task.where(done: true).order(updated_at: :desc)
    tasks_pending = Task.where(done: [nil, false]).order(priority: :desc, due_date: :asc)
    @tasks = tasks_pending + tasks_done
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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

  def toggle
    if @task.done
      @task.done = false
      message = 'Task was marked as to do'
    else
      @task.done = true
      message = 'Task was succesfully completed'
      last_checked = @task.id
    end
    if @task.priority == 1 and @task.done           #fireworks
      fireworks = true
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: message, flash: { last_checked: last_checked, fireworks: fireworks }}
        format.json { head :no_content }
      else
        format.html { redirect_to tasks_url, notice: 'Something went wrong!' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :due_date, :priority, :done)
    end
end
