class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resouce)
   customers_mypage_path
  end
end
