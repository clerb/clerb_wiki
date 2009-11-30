class WikiController < ApplicationController
  
  def index
    @wiki_document = WikiDocument.last
  end

  def show
    @wiki_document = WikiDocument.find_by_title(params[:title])
  end
  
  def new
    @wiki_document = WikiDocument.new
  end
  
  def edit 
    @wiki_document = WikiDocument.find(params[:id])
  end
  
  def create
    @wiki_document = WikiDocument.new(params[:wiki_document])
    if @wiki_document.save
      flash[:notice] = "Document has been created!"
      redirect_to wiki_path @wiki_document.title
    else
      flash[:notice] = "FAIL!"
      render :new
    end
  end
  
  def update
    @wiki_document = WikiDocument.find(params[:id])
    if @wiki_document.update_attributes(params[:wiki_document])
      flash[:notice] = "Document has been updated!"
      redirect_to wiki_path @wiki_document.title
    else
      flash[:notice] = "FAIL!"
      render :new
    end
  end

end
