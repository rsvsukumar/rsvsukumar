class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    ar_names = Artist.all.map(&:name).uniq
    @artists =  Artist.where("name in(?)", ar_names)
    respond_with(@artists)
  end

  def show
    respond_with(@artist)
  end

  def new
    @artist = Artist.new
    respond_with(@artist)
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  def update_data
    data = params[:result][:results].first[1]
    @artist = Artist.find(params[:id])
    gender = data["gender"]
    name = data["name"]
    title = name["title"]
    large = data["picture"]["large"]
    medium = data["picture"]["medium"]
    thumbnail = data["picture"]["thumbnail"]

    unless @artist.artist_profile.present?
      @artist_profile = @artist.build_artist_profile
      @artist_profile.title =  title
      @artist_profile.gender =  gender
      @artist_profile.large =  large
      @artist_profile.medium =  medium
      @artist_profile.thumbnail =  thumbnail
      @artist_profile.save
    end

    render json: {}
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
