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
  session['stripn'] = session['string'].gsub(/\n/,"")
  session['stripr'] = session['stripn'].gsub(/\r/,"")
  session['killHead'] = session['stripr'].gsub(/.*<\/head>/i, "")
  session['string'] = session['killHead']
  
  for i in 0..200
    session['string']=session['string'].gsub(/<p[^>]/i, "<p")
  end
  session['string']=session['string'].gsub(/p>/i, "p>")

  session['string']=session['string'].gsub(/b>/i, "b>")

  for i in 0..200
    session['string']=session['string'].gsub(/<[^\/pbhiesoul][^>]/i, "<%")
  end
  
  for i in 0..200
    session['string']=session['string'].gsub(/<s[^t>]/i, "<%")
  end
  for i in 0..200
    session['string']=session['string'].gsub(/<\/s[^t>]/i, "<%")
  end
  
  session['string']=session['string'].gsub(/<%>/, "")
  
  for i in 0..200
    session['string']=session['string'].gsub(/<body[^>]/i, "<body")
  end
  
  session['string']=session['string'].gsub(/<body>/i, "")
  session['string']=session['string'].gsub(/<\/body>/i, "")
  
  for i in 0..200
    session['string']=session['string'].gsub(/<span[^>]/i, "<span")
  end

  session['string']=session['string'].gsub(/<span>/i, "")
  session['string']=session['string'].gsub(/<\/span>/i, "")
  
  session['string']=session['string'].gsub(/<o:p>/i, "")
  session['string']=session['string'].gsub(/<\/o:p>/i, "")
  
  session['string']=session['string'].gsub(/<\/div>/i, "")
  session['string']=session['string'].gsub(/<\/html>/i, "")
  
  session['string']=session['string'].gsub(/<b/i, "<b>")
  session['string']=session['string'].gsub(/b>>/i, "b>")
  
  session['string']=session['string'].gsub(/ul>/i, "ul>")
  
  for i in 0..200
    session['string']=session['string'].gsub(/<ol[^>]/i, "<ol")
  end
  session['string']=session['string'].gsub(/ol>/i, "ol>")
  
  session['string']=session['string'].gsub(/li>/i, "li>")

  erb :edit
end

get '/done' do
  erb :done
end