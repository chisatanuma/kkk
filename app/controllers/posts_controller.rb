class PostsController < ApplicationController
  def index
  @posts = Post.all
  end

  def show
    # find_byを用いてpostsテーブルから「params[:id]」に対応するデータを取り出し、変数@postに代入してください
    @post = Post.find_by(id: params[:id])
  end

  def new
    # newメソッドを用いて、Postクラスのインスタンスを作成し、変数@postに代入してください
    @post = Post.new
  end

  def create
    @post = Post.new(name: params[:name] , content: params[:content] , image_name:"default_user.jpg")

    if params[:image]
         @post.image_name = "#{@post.id}.jpg"
         image = params[:image]
         File.binwrite("public/user_images/#{@post.image_name}", image.read)
       end

    if @post.save
      # 変数flash[:notice]に、指定されたメッセージを代入してください
      flash[:notice] = "created"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

  if params[:image]
       @post.image_name = "#{@post.id}.jpg"
       image = params[:image]
       File.binwrite("public/user_images/#{@post.image_name}", image.read)
     end

     if @post.save
       flash[:notice] = "done"
       redirect_to("/posts/index")
     else
       render("posts/edit")
     end
   end


  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    # 変数flash[:notice]に、指定されたメッセージを代入してください
    flash[:notice] = "deleted"
    redirect_to("/posts/index")
  end

end
