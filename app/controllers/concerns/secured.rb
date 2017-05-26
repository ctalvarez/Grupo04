module Secured
  ActiveRecord::Concern

  def admin?
    redirect_to root_path unless current_user&.admin?
  end

  def logged_in?
    redirect_to root_path unless current_user
  end

end
