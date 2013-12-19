require 'sinatra'
#enable :sessions
use Rack::Session::Pool


get '/hi' do
  "Hello World!"
end

get '/' do 
  erb :home 
end

post '/api/upload' do
  if params[:file]

    filename = params[:file][:filename]
    # puts params[:file] #shouldn't need this right now
    session['f'] = params[:file][:tempfile].read #f = binary representation of file
    #session[:fileupload] = params[:file][:tempfile]
    puts session['f']
    
    file_object=params[:file]
    #puts file_object[:type] #No longer necessary, right?
    
    session['string'] = session['f'] #This is a test.
    
    # session[:mydoc] = params[:mydata]
    
    #/doc/:id
    # QUESTION: HOW TO SET UP ID?
    

    #"Doc uploaded"
    redirect '/edit'
  end
end
  
#PART TWO: LOADING THE SCREEN FOR CORRECTIONS

get '/edit' do
  #things
  erb :edit
      # in edit route...
    # @filetext = session[:fileupload].read
      # do doc to html conversion here
      
    
    # The above may be useful, or it may not, but it'll at least remind me of what needs doing.

end


  # do doc to html conversion here
  def ConvertHTML(f, filename)
    # Create a new filename
    # f.write
    # f.each_char do 
      # if ch == "<"
        # if f[ch+1].lowercase == "p" || f[ch+1].lowercase = "h" || f[ch+1].lowercase
          # pass
        #end
        # else
          #delete all text until the next ">" -- coding for this?
          # (ugly but possible) alternative: split string at "<"
    # new = f. Create a new file for writing in
  end
  #

#not_found do
#  "Sorry! It looks like the page you are looking for doesn't exist. Try again? (404 Not Found error)"
#end
#
#error do
#  "Something went wrong. (500 Internal Server error)"
#end

def ConvertHTML(f, filename)
  # Create a new filename
  # f.write
  # f.each_char do 
    # if ch == "<"
      # if f[ch+1].lowercase == "p" || f[ch+1].lowercase = "h" || f[ch+1].lowercase
        # pass
      #end
      # else
        #delete all text until the next ">" -- coding for this?
        # (ugly but possible) alternative: split string at "<"
  # new = f. Create a new file for writing in
  
  goodTags = ["<b", "<p", "<h1", "<h2", "<h3", "<h4", "<h5", "<h6", "<i", "<strong", "<ol", "<ul", "<li", "<u"]
  #f.gsub()
end
#

