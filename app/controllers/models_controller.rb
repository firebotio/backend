class ModelsController < ApplicationController
  include BackendAppFindable

  before_action :require_login
  before_action :find_app

  def create
    @model = @app.models.new permitted
    if @model.save
      flash[:success] = "Model created"
      redirect_to backend_app_models_path @app
    else
      @errors = stringify_single_error @model.errors
      render "new"
    end
  end

  def index
    @models = @app.models
  end

  def new
    @model = @app.models.new
  end

  private

  def backend_app_id_key
    :backend_app_id
  end

  def permitted_params
    %i(name)
  end
end
