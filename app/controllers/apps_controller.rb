class AppsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  
  def index
    @apps = App.order(:name)
    render json: { apps: @apps }
  end

  def show
    # { app: name, categories
  end

  def create
    @app = App.new(app_params)
    if @app.save
      render json: { message: 'App created successfully' }
    else
      render json: { message: 'App not saved' }
    end
  end

  private

  def app_params
    params.require(:app).permit(:name, :app_id, categories_attributes: [ :name])
  end
end
