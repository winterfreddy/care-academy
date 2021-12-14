class Api::CoursesController < ApplicationController

    def index
        @courses = Course.all
        render :index
    end

    def show
        @course = Course.find_by(id: params[:id])
        if @course
            render :show
        else
            render json: ['No course found for this id'], status: 422
        end
    end

    def create
        @course = Course.new(course_params)
        if @course.save!
            render :show
        else
            render json: @course.errors.full_messages, status: 422
        end
    end

    def update

    end

    def destroy

    end

    private
    def course_params
        self.params.require(:course).permit(:name, :release_date)
    end
    
end
