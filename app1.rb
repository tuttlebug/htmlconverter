require 'sinatra'
enable :sessions


get '/hi' do
  "Hello World!"
end

get '/home' do 
  erb :home 
end

#get '/doc/:id' do
#  # Is this necessary? And if so, what (if anything) should go here?
#end

post '/api/upload' do
  if params[:file]

    filename = params[:file][:filename]
    # puts params[:file] #shouldn't need this right now
    f = params[:file][:tempfile].read #f = binary representation of file
    #session[:fileupload] = params[:file][:tempfile]
    
    file_object=params[:file]
    #puts file_object[:type] #No longer necessary, right?
    
    #giant If statement
    #if "word" not in file_object[:type] && "html" not in file_object[:type] && "text" not in file_object[:type]
      #How do I delete the file?
      #How do I show an error message *to the user*--i.e., pop up an error message programmatically?
    #end
    session['string'] = "moo"
    
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

