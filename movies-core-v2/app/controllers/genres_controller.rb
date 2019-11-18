class GenresController < ApplicationController
    before_action :set_genre, only: [:destroy]

    def index
        @genres = Genre.all
        render json: @genres
    end
    
    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            render json: @genre, status: :created
        else
            render json: @genre.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @genre.destroy
        
        head :no_content
    end

    private

    def set_genre
        @genre = Genre.find(params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name)
    end

end
