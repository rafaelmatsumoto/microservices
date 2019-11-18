class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :destroy, :update]

    def index
        @movies = Movie.all
        render json: @movies
    end

    def show
        render json: @movie
    end

    def create
        @movie = Movie.new(movie_params)

        if @movie.save
            render json: @movie, status: :created
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    def update
        if @movie.update(movie_params)
            render json: @movie, status: :update
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @movie.destroy
        head :no_content
    end

    private 

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:name, :genre_id, :description, :image, :release_date, :price)
    end
end
