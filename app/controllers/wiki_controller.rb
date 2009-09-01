class WikiController < ApplicationController

  def show
    @wiki_document = WikiDocument.find_by_title(params[:title])
  end

end
