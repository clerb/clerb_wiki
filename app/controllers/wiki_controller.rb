class WikiController < ApplicationController

  def index
  end

  def show
  end

  def new
    @wiki_document = WikiDocument.new
  end

  def edit
  end

  def create
    @wiki_document = WikiDocument.new(params[:wiki_document])
    if wiki_document.save
      flash[:notice] = "Document has been created!"
      redirect_to wiki_document_path(wiki_document)
    else
      flash[:notice] = "FAIL!"
      render :new
    end
  end

  def update
    if wiki_document.update_attributes(params[:wiki_document])
      flash[:notice] = "Document has been updated!"
      redirect_to wiki_document_path(wiki_document)
    else
      flash[:notice] = "FAIL!"
      render :edit
    end
  end

  def destroy
    if wiki_document.delete
      flash[:notice] = "Document has been deleted!"
      redirect_to root_path
    else
      flash[:notice] = "FAIL!"
      render wiki_document_path(wiki_document)
    end
  end

private

  helper_method :wiki_documents
  def wiki_documents
    @wiki_documents ||= WikiDocument.all(:order=>'updated_at DESC', :limit=>5)
  end

  helper_method :wiki_document
  def wiki_document
    @wiki_document ||= WikiDocument.find_by_title(params[:id])
  end

end
