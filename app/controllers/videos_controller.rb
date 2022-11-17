class VideosController < ApplicationController
  def index
    videos = Video.all
    
    render json: videos, status: :ok
  end

	# private

	# def video_params
	# 	params.require(:video).permit(:user_id)

	# end
end
