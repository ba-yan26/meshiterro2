class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_actionはコントローラーの全てのアクションが実行される前に何らかの処理を行う時に使用する
  # if:はbefore_actionのオプションの一つ。値にメソッド名（:devise_controller）を指定することで戻り値がtrueであれば処理を実行する
  
  def after_sign_in_path_for(resource)
    # サインイン後にどこに遷移するか
    # after_sign_in_path_forはdevise側が用意しているメソッド
    # deviseの初期設定はroot_pathになっているために遷移先を変更する必要がある
    about_path
  end
  
  def after_sign_out_path_for(sesource)
    about_path
  end
  
  protected
  # privateは記述したコントローラー内でしか参照できない
  # protectedは呼び出された他のコントローラーからも参照することができる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
  end
end
