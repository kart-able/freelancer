class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  before_action :authenticate_user!

  # ajout cf https://activeadmin.info/13-authorization-adapter.html
  # en lien avec active_admin.rb ligne 81
  def access_denied(exception)
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
   end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
end
