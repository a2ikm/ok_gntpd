require "socket"

require File.expand_path("../ok_gntpd/version", __FILE__)

class OkGntpd
  def self.start(options = nil)
    new(options).start
  end

  def initialize(options = nil)
    @options = default_options.merge(options || {})
  end

  def start
    port = @options[:port]
    puts "Start listening GNTP on #{port}."

    gate = TCPServer.open(port)
    begin
      loop do
        sock = gate.accept
        while msg = sock.gets
          sock.write <<EOS
GNTP/1.0 -OK NONE\r\n
\r\n
EOS
        end
      end
    ensure
      gate.close
      sock.close if defined?(sock)
      puts "Closed."
    end
  end


  private
    def default_options
      {
        :port   => 23053
      }
    end
end
