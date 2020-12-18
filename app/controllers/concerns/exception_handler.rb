require 'active_support/concern'

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      # render json: ( {message: exception.message}, status: :not_found)
      flash[:alert] = exception.message
      redirect_to(action: 'new')
    end

    # rescue_from ActiveRecord::RecordInvalid do |exception|
    #   # render json: ( { message: exception.message }, status: 422)
    #   flash[:notice] = exception.message
    # redirect_to(:action => 'new')
    # end
  end
end


    
