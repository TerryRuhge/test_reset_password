class SignsController < ApplicationController
    def new
        @sign = Sign.new
        @signs = Sign.all

    end

    def create
        @sign = Sign.new(sign_params)
        if @sign.save
            redirect_to new_sign_path
        end
    end


    private
        def sign_params
            params.require(:sign).permit(:updatetime, :status)
        end
end

