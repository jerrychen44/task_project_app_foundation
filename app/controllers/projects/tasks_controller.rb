#add for nested routes, change TasksController < ApplicationController to Projects::TasksController < ApplicationController
class Projects::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit,:update,:destroy]

  #add for nested routes
  before_action :set_project, only: [:show, :new, :edit, :create, :update,:destroy]
  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    #add for nested routes
    #we can use @prjoect becasue the before_action set_project
    @task.project_id = @project.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_url(@task.project_id), notice: "Task was created successfully!"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      #because we run the set_task , so we can use the @task in next line.
      if @task.update(task_params)
        format.html { redirect_to project_url(@task.project_id), notice: "Task was updated successfully!"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    #because we run the set_task , so we can use the @task in next line.
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@task.project_id), notice: "Task was destroy successfully!"}
      format.json {head :no_content}
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    #add for nested routes
    def set_project
      #add for nested routes
      #url like, .com/projects/5/tasks/2, project_id = 5
      @project = Project.find(params[:project_id])
    end

    def task_params
      # require(table name) , permit (white list variable name)
      #table in scheme.rb
      #create_table "tasks", force: :cascade do |t|
        #t.string   "title"
        #t.text     "description"
        #t.integer  "project_id"
        #t.datetime "created_at",  null: false
        #t.datetime "updated_at",  null: false
        #t.boolean  "completed"
        #t.text     "task_file"
        #t.index ["project_id"], name: "index_tasks_on_project_id"
      #end
      params.require(:task).permit(:title,:description, :project_id, :completed, :task_file)
    end
end
