#json2gelf Docker container

##Description

Gets JSON lines from stdin and forward it as GELF packet.

##Compilation

```
docker build -t varnishgelf .
```

##Usage

```
docker run -dt --name=varnishgelf -v /var/lib/varnish:/var/lib/varnish --net=host
```

###Environment variables

```
GELF_HOST = 127.0.0.1
GELF_PORT = 12345
NO_VALIDATE_JSON = no

$ ./json2gelf --help

Usage: json2gelf [OPTION...]
json2gelf -- Forward line separated JSON to a UDP GELF server

  -f, --file=FILE            Input file (default: /dev/stdin)
  -h, --host=HOST            GELF remote server (default: 127.0.0.1)
  -p, --port=PORT            GELF remote port (default: 12345)
  -n, --no-validate-json     Skip JSON packet checks (default: no)
  -v, --verbose              Increase verbosity
  -?, --help                 Give this help list
      --usage                Give a short usage message
  -V, --version              Print program version

Mandatory or optional arguments to long options are also mandatory or optional
for any corresponding short options.

Report bugs to <gregory@siwhine.net>.
```


