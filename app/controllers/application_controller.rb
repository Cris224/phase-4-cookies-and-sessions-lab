class ApplicationController < ActionController::API
  include ActionController::Cookies

  def show
    session[:page_views] ||= 0
    session[:page_views] + 1
    if session[:page_views] < 4
    render json: { session: session, cookies: cookies.to_hash }
    else
      render json: error, status: :unautorized
    end
  end

end
