class CommentsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @comment = @products.comments.build
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @products, notice: "get the eff out"
    end
  end

  def create
    @comment = @products.commments.build(comment_params)
    if @comment.save
      redirect_to @products 
    else
      render :new
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @products
    else
      render :edit
  end

  def destroy
    @comment = Comment.find(parmas[:id])
    if @comment.user = current_user
      @comment.destroy
      redirect_to @products
    else
      redirect_to @products, notice "You have no authority here, beyatch"
    end
  end

  private

  def set_products
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comments).permit(:body, :user_id, :product_id)
  end

end
