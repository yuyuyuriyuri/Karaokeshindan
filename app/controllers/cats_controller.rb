class CatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create]
  def index
    end
  
    def new
      @cat = Cat.new
    end
  
    def show
      @cat = Cat.find_by(id: params[:id])
    end
  
    def create
      @cat = Cat.new(cat_params)
      @cat.user_id = current_user.id
      params[:cat][:question] ? @cat.question = params[:cat][:question].join("") : false
      if @cat.save
          flash[:notice] = "診断が完了しました"
          redirect_to cat_path(@cat.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def cat_params
        params.require(:cat).permit(:id, question: [])
    end
  end
  