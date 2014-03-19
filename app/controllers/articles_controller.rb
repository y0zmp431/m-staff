
class ArticlesController < ApplicationController
	load_and_authorize_resource :find_by => :url
  autocomplete :dog, :name
  # GET /articles
  # GET /articles.json
  def index
		if params[:unpublished] 
			@articles = Article.unpublished
      raise CanCan::AccessDenied if cannot? :read, @articles 
		else
			@articles = Article.published
		end
    @articles = @articles.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_by_url(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find_by_url(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
		@article.user = current_user

    respond_to do |format|
      if @article.save
				if @article.published?
					text_published = ' and published'
				else
					text_published = ' (no published)'
				end
        format.html { redirect_to @article, notice: t("Article was successfully created#{ text_published }.") }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find_by_url(params[:id])

    respond_to do |format|

			old_url = @article.url

      if @article.update_attributes(params[:article])

				notice_message = t('article.updated')
				if params[:article].count == 1
					notice_message = t("article.unpublished", :link => article_path(@article), :title => @article.title) if params[:article][:published] == false 
					notice_message = t("article.published", :link => article_path(@article), :title => @article.title) if params[:article][:published] == true 
				end
				
				if @article.url != old_url or request.referer == edit_article_url(@article)
          path = article_path(@article) 
        else
          path = :back
        end

        format.html { redirect_to path, notice: "#{notice_message.html_safe} http_ref=#{request.headers["HTTP_REFERER"]}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find_by_url(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
