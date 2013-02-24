# OkGntpd

An GNTPd which always return "OK".

## Installation

Add this line to your application's Gemfile:

    gem 'ok_gntpd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ok_gntpd

## Usage

### As non-daemon

Start GNTP server with:

    $ ok_gntpd

Press Ctrl-C to stop it.
You can specify port number with `-p` (default 23053).

### As daemon

Start GNTP server with:

    $ ok_gntpd -d

You can specify pid file with `-P` (default /var/run/ok_gntpd.pid).

Stop it with:

    $ ok_gntpd -k -P /path/to/pid/file

### Help!

    $ ok_gntpd --help


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
