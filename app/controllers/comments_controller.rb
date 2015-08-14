class CommentsController < ApplicationController

	#POST /comments
	def create
		comment = Comment.new(comments_params)
		if comment.save
			render json: comment, serializer: CommentsSerializer
		end
		# else
		# 	render json: {error: ('comment_create_error')}, status: :unprocessable_entity
		# end
	end

	def comments_params
		comment = params.require(:comment).permit(:body, :question)
		{user: current_user, question: Question.find(comment["question"]), body: comment["body"]}
	end

end