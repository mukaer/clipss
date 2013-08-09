class ClipssHttpd < Sinatra::Base
  configure  do
    register Sinatra::Reloader  if Clipss.config.env == :development
    set :logging     , Clipss.config.logging
    set :dump_errors , Clipss.config.dump_errors
  end

  get '/' do
     slim view_index
  end

  get '/form' do
    slim view_form
  end

  post '/push' do

    @pushdata=params[:pushdata]
    Push.httpd_run @pushdata
    slim view_push ,:content_type => 'text'
  end

  get '/push_rsv' do
    PushRSV.run
    slim view_push ,:content_type => 'text'
  end

  get '/pop' do
    @pop=Pop.httpd_run
    slim view_pop ,:content_type => 'text'

  end

end


class ClipssHttpd

  def view_index
    Proc.new { <<EOF
p
  a href="/pop" target="_blank"
    | SHOW
p
  a href="/form" target="_blank"
    | SET
p
  a href="/push_rsv" target="_blank"
    | PUSH_RSV RUN
EOF
    }
  end


  def view_push
    Proc.new {"| -- OK set Clipss_FILE --"
    }
  end


  def view_pop
    Proc.new{ "== @pop "}
  end


  def view_form
    Proc.new{<<EOF
form name="push_form" method="post" action="/push"
  div pushdata
  textarea name="pushdata" cols="40" rows="7"
  div
  input    name="submit" type="submit" value="submit"
EOF

    }
  end


end
