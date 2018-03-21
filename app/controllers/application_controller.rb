class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  before_action :authenticate_user!

  # ajout cf https://activeadmin.info/13-authorization-adapter.html
  # en lien avec active_admin.rb ligne 81
  def access_denied(exception)
    redirect_to admin_organizations_path, alert: exception.message
  end

end
