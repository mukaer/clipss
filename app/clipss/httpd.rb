# Clipss
module Clipss
  # Httpd modele
  class Httpd < Sinatra::Base
    configure  do
      register Sinatra::Reloader if Clipss.config.env == :development
      set :logging     , Clipss.config.logging
      set :dump_errors , Clipss.config.dump_errors
      ClipboardWatcher.run
    end

    get '/' do
      slim view_index
    end

    get '/form' do
      slim view_form
    end

    post '/push' do
      @pushdata = params[:pushdata]
      Cmd.push_http @pushdata
      slim view_push , content_type: 'text'
    end

    get '/push_rsv' do
      Cmd.push_http_rsv
      slim view_push , content_type: 'text'
    end

    get '/pop' do
      @pop = Cmd.pop_http
      slim view_pop , content_type: 'text'

    end

    get '/history' do
      @historys = Clipss::Var::History.all
      slim view_history
    end

  end

  # Httpd view
  class Httpd

    def view_index
      proc do <<EOF
p
  a href="/pop" target="_blank"
    | SHOW
p
  a href="/history" target="_blank"
    | HISTORY
p
  a href="/form" target="_blank"
    | SET
p
  a href="/push_rsv" target="_blank"
    | PUSH_RSV RUN
EOF
      end
    end

    def view_push
      proc { '| -- OK set Clipss_FILE --' }
    end

    def view_pop
      proc { '== @pop ' }
    end

    def view_form
      proc do <<EOF
form name="push_form" method="post" action="/push"
  div pushdata
  textarea name="pushdata" cols="40" rows="7"
  div
  input    name="submit" type="submit" value="submit"
EOF
      end
    end

    def view_history
      proc do <<EOF
- @historys.each_with_index do |h,i|
  div \#{i} \#{h.date} \#{h.content}
EOF
      end
    end
  end
end
