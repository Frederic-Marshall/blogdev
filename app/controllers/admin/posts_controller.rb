class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :destroy, :update]

  def new
    @post = current_user.posts.build  
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      flash.now[:danger] = 'Произошла ошибка'
      render :new 
    end
  end

  def edit
  end 

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Статья успешно обновлена'
    else
      flash.now[:danger] = 'Произошла ошибка'
      render :edit
    end
  end
  
  def destroy
    @post.destroy

    redirect_to root_path, success: 'Статья удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end
end