require "socket"

require File.expand_path("../ok_gntpd/version", __FILE__)

class OkGntpd
  def self.start(options = nil)
    new(options).start
  end

  def self.default_options
    {
      :port   => 23053
    }
  end

  attr_reader :options, :status

  def initialize(options = nil)
    @options = self.class.default_options.merge(options || {})
    @status = :stop
  end

  def started?
    status == :start
  end

  def start
    port = @options[:port]
    puts "Start listening GNTP on #{port}."

    gate = TCPServer.open(port)
    begin
      @status = :start
      loop do
        sock = gate.accept
        sock.write <<EOS
GNTP/1.0 -OK NONE\r
\r
EOS
        sock.close
      end
    ensure
      gate.close
      @status = :stop
      puts "Closed."
    end
  end
end
