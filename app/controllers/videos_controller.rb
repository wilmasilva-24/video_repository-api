class VideosController < ApplicationController
  def index
    videos = Video.all
    videos = videos.joins(:category).where(category: {name: params[:category_name]}) if params[:category_name].present?
      
    render json: videos, status: :ok, each_serializer: Videos::Index::VideoSerializer
  end
  
  def show
    video = Video.find(params[:id])

    render json: video, status: :ok
  end

  def create
    video = Video.new(video_params)
    if video.save
      render json: video, status: :created
    else
      render json: video.errors.full_messages, status: 422
    end
  end

	private

	def video_params
		params.require(:video).permit(:name, :description, :url, :user_id, :category_id)
	end
end
