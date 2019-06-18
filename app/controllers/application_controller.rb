class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message, status: :unauthorized }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def after_sign_in_path_for(user)
    if user.admin?
      admin_root_path
    elsif user.staff?
      staff_root_path
    else
      root_path
    end
  end
end
