class WordsController < ApplicationController

  before_filter :authenticate, :only => [:heroku]

  def index
  end
  
  def heroku    
    render :json => { :id => 'booboo', :config => { "RHYMETIME_URL" => "http://arpabet.heroku.com/" } }
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
  
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "rhymetime" && password == "PuBFDICYkq55Vmxc"
    end
  end

end