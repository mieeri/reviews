class DoramasController < ApplicationController
  def index
    @doramas = Dorama.all
  end

  def show
    @dorama = Dorama.find(params[:id])
  end

  def new
    @dorama = Dorama.new
  end

  def create

    #
    # [:dorama]ってのが抜けてたからだめやった。paramsの中のdoramaの中にtitleとかstoryとかがまとまって入ってたねん。
    #
    @dorama = Dorama.new(title: params[:title], story: params[:story]) # ←以前の書き方
    @dorama = Dorama.new(title: params[:dorama][:title], story: params[:dorama][:story]) # ←正解の書き方

    #
    # 正解の書き方で通るんやけど、さらに安全に書くには以下の書き方がいい。理由はしたのdorama_paramsに書いてる。
    #
    @dorama = Dorama.new(dorama_params)


    if @dorama.save
      redirect_to @dorama, notice: "登録されました。"
    else
      render 'new'
    end
  end

  #
  # ↓こいつはユーザーのリクエストしてきたパラメーターをまとめてるもの。と同時に悪意のあるパラメータをなげられないようにpermitでリクエストできるものを制限してる。
  #
  private
  def dorama_params
    params.require(:dorama).permit(:story, :title, :image)
  end
end
