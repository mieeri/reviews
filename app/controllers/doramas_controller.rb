class DoramasController < ApplicationController
  def index
    @doramas = Dorama.all
  end

  def show
    @dorama = Dorama.find(params[:id])
  end

  def new
    @dorama = Dorama.new
    @dorama = Dorama.find_by(title: params[:title], story: params[:stroy])
  end

  def create
    @dorama = Dorama.new(title: params[:title], story: params[:stroy])
    if @dorama.save!
      redirect_to @dorama, notice: "登録されました。"
    else
      render 'new'
    end
  end

  def dorama_params
    params.require(:dorama).permit(:story, :title)
  end
end
