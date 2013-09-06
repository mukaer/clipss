module Clipss
  module Var
    # RemoteSvs
    module RemoteSvs
      extend Var

      def push_rsvs(data)
        remote_svs = Clipss.config.remote_svs
        result = []

        Log.debug("@remote_svs = #{@remote_svs}")
        Log.debug("post date \n--data start--\n#{data}\n--data end--\n")

        # future thread. (Parallel)
        remote_svs.each do |url|
          result.push  post_content(make_url_push(url), 'pushdata' => data)
        end

        result
      end

      def post_content(url, hash_data)
        clnt = HTTPClient.new
        begin
          result = Timeout.timeout(1) do
            clnt.post_content(url, hash_data)
          end
        rescue
          result = nil
          Log.info("cannot post_content #{url}")
        else
          Log.info("push_rsv #{url}")
          Log.debug("post  \n--data start--\n#{result}\n--data end--\n")
        end
        result
      end

      def make_url_push(url)
        "#{url}/push"
      end

      def get
        nil
      end

      alias_method    :update, :push_rsvs
      module_function :push_rsvs, :post_content, :make_url_push, :update, :get

    end
  end
end
