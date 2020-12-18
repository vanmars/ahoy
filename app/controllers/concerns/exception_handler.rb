require 'active_support/concern'

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      flash[:alert] = exception.message
      redirect_to(action: 'new')
    end

    # rescue_from NoMethodError do |exception|
    #   flash[:alert] = "Sorry! No record matches your search. Please try another title."
    #   redirect_to(action: 'new')
    # end

  end
end


    
