class KidsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
      if params[:search] == nil
        @kids = Kid.all
      elsif params[:search] == ''
        @kids = Kid.all
      else
        @kids = Kid.where("name LIKE ? ",'%' + params[:search] + '%')
      end
      @kids = @kids.page(params[:page]).per(3)
    end

    def new
        @kid = Kid.new
      end
    
      def create
        kid = Kid.new(kid_params)

        kid.user_id = current_user.id 

        if kid.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
      @kid = Kid.find(params[:id])
    end

    def edit
      @kid = Kid.find(params[:id])
    end

    def update
      kid = Kid.find(params[:id])
      if kid.update(kid_params)
        redirect_to :action => "show", :id => kid.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      kid = Kid.find(params[:id])
      kid.destroy
      redirect_to action: :index
    end

        private
        def kid_params
          params.require(:kid).permit(:name, :genre, :about)
             end
end
