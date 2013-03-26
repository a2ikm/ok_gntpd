require "spec_helper"

describe OkGntpd do
  specify do
    server = OkGntpd.new(
      :port => TCPServer.open('127.0.0.1', 0) { |s| s.addr[1] }
    )
    t = Thread.new(server) do |s|
      Thread.pass
      s.start
    end
    t.join(0.05) until server.started?

    begin
      sock = TCPSocket.open("127.0.0.1", server.options[:port])
      sock.write <<EOS
GNTP/1.0 REGISTER NONE\r
Application-Name: ok_gntpd\r
\r
EOS

      response = sock.read
      response.should == <<EOS
GNTP/1.0 -OK NONE\r
\r
EOS
    ensure
      sock.close
      t.exit
    end
  end
end
