class DoramasController < ApplicationController
  def index
    @doramas = Dorama.all
    @popular_dorama = Dorama.by_tweet_number.count

    if params[:id].present?
    set_dorama
    else
    @dorama = Dorama.new
    end
  end

  def show
    @dorama = Dorama.find(params[:id])
    @tweets = TwitterClient.get_client.search("#" + "#{@dorama.hash_tag} -rt", lang: "ja")
  end

  def new
    @dorama = Dorama.new
  end

  def create
    @dorama = Dorama.new(dorama_params)
    if @dorama.save
      redirect_to @dorama, notice: "登録されました。"
    else
      render 'new'
   end
  end

  def edit
    @dorama = Dorama.find(params[:id])
  end

  def update
    @dorama = Dorama.find(params[:id])

    if @dorama.update(dorama_params)
      redirect_to @dorama
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @dorama = Dorama.find(params[:id])
    @dorama.destroy

    redirect_to doramas_path
  end

  #
  # ↓こいつはユーザーのリクエストしてきたパラメーターをまとめてるもの。と同時に悪意のあるパラメータをなげられないようにpermitでリクエストできるものを制限してる。
  #
  private
  def dorama_params
    params.require(:dorama).permit(:story, :title, :image)
  end
end
