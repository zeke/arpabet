class WordsController < ApplicationController
  
  def index
  end
  
  def show
    @word = Word.find_by_spelling(params[:id])
    
    @per_page = (params[:limit] || 50).to_i
    
    @page = 1
    @page += (params[:skip].to_i/@per_page).to_i if params[:skip].present?
        
    @rhymes = @word.rhymes.paginate(:page => @page, :per_page => @per_page)

    if @word.blank?
      render :json => []
    elsif params[:delimited].present?
      render :text => @rhymes.map(&:spelling).join(';')
    elsif params[:full].present?
      render :json => @rhymes, :except => [:id, :created_at, :updated_at]
    else
      render :json => @rhymes.map(&:spelling)
    end
  end
  
end