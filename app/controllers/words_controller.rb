class WordsController < ApplicationController
  
  def index
  end
  
  def show
    @word = Word.find_by_spelling(params[:id])

    if @word.blank?
      render :json => []
    elsif params[:delimited].present?
      render :text => @word.rhymes.map(&:spelling).join(';')
    elsif params[:full].present?
      render :json => @word.rhymes, :except => [:id, :created_at, :updated_at]
    else
      render :json => @word.rhymes.map(&:spelling)
    end
  end
  
end