class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

      def create
        @question = current_user.questions.build(question_params)
        if @question.save
          flash[:success] = "Question asked!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
      end
    
      def destroy
      end
    
      private
    
        def question_params
          params.require(:question).permit(:content)
        end
end
