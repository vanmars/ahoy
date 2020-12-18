class ExceptionHandler

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
    flash[:notice] = exception.message
    redirect_to(:action => 'new')
  end

end