class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # 上記コードを要約↓↓↓↓↓
    # @post_image(投稿データ)はuser_idを、current_user.id(今ログインしているユーザーのID)に指定することで、投稿データにログイン中のユーザーのIDを持たせることができる
    # @post_imageはPostImage.newによって生成された空のモデル
    # モデル名.カラム名 で保存するカラムの中身を操作できる
    # current_user.id でログイン中のユーザー情報を取得することができる(deviseのヘルパーメソッド)
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name,:caption,:image)
    # formで送られてきたデータはprivateに格納される
    # 格納されたデータはPostImage.new(post_image_params)に戻り値として反映
  end
  
end
