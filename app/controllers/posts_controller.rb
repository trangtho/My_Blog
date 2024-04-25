class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy ]

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @post.save
        format.html { redirect_to my_post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(user_id: current_user.id, title: post_params['title'], content: post_params['content'])
        if post_params['images'].present?
          post_params['images'].each do |image|
            @post.images.attach(image)
          end
        end
        format.html { redirect_to my_post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        post_params['category_ids'].each do |category_ids|
          @postcategory = @post.postcategories.update(category_id: category_ids)
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to my_post_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_post
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(3)
  rescue StandardError
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  rescue StandardError
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, images: [], category_ids: [])
  end
end
