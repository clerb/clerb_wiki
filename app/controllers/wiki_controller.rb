class WikiController < ApplicationController

  def index
    @wiki_documents = WikiDocument.all(:order=>'updated_at DESC', :limit=>5)
  end

  def show
    @wiki_document = WikiDocument.find_by_title(params[:id])
  end

  def new
    @wiki_document = WikiDocument.new
  end

  def edit
    @wiki_document = WikiDocument.find_by_title(params[:id])
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
    @wiki_document = WikiDocument.find_by_title(params[:id])
    if @wiki_document.update_attributes(params[:wiki_document])
      flash[:notice] = "Document has been updated!"
      redirect_to wiki_path @wiki_document.title
    else
      flash[:notice] = "FAIL!"
      render :edit
    end
  end

  def destroy
    @wiki_document = WikiDocument.find_by_title(params[:id])
    if @wiki_document.delete
      flash[:notice] = "Document has been deleted!"
      redirect_to root_path
    else
      flash[:notice] = "FAIL!"
      render wiki_path @wiki_document.title
    end
  end

end
