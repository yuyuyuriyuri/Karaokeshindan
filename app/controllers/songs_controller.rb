class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create]
    def top
    end
    def index
    end
  
    def new
      @song = Song.new
    end
  
    def show
      @song = Song.find_by(id: params[:id])
    end
  
    def create
      @song = Song.new(song_params)
      params[:song][:question] ? @song.question = params[:song][:question].join("") : false
      if @song.save
          flash[:notice] = "診断が完了しました"
          redirect_to song_path(@song.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def song_params
        params.require(:song).permit(:id, question: [])
    end
  end
  