class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.' 
    else
      redirect_to root_url, notice: 'Couldn\'t post'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url, notice: 'Post was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:text, :user_id)
    end
end
