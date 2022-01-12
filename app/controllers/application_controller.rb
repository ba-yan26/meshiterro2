class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_actionはコントローラーの全てのアクションが実行される前に何らかの処理を行う時に使用する
  # if:はbefore_actionのオプションの一つ。値にメソッド名（:devise_controller）を指定することで戻り値がtrueであれば処理を実行する
  
  
  protected
  # privateは記述したコントローラー内でしか参照できない
  # protectedは呼び出された他のコントローラーからも参照することができる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
  end
end
