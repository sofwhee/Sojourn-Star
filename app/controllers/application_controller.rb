class ApplicationController < ActionController::Base
  NotAuthorized = Class.new(StandardError)
  # ...or if you really want it to be ActionController
  # NotAuthorized = Class.new(ActionController::RoutingError)

  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   render_error_page(status: 404, text: 'Not found')
  # end

  # rescue_from ApplicationController::NotAuthorized do |exception|
  #   render_error_page(status: 403, text: 'Forbidden')
  # end

  private

  def render_error_page(status:, text:, template: 'errors/routing')
    respond_to do |format|
      format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
      format.html { render template: template, status: status, layout: false }
      format.any  { head status }
    end
  end

  # def index
  #   if current_user.admin?
  #     # ....
  #   else 
  #     raise ApplicationController::NotAuthorized
  #   end
  # end
end
