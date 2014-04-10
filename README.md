
Devtools Reloader Station
------

### Installlation

```
npm install -g devtools-reloader-station
```

### Usage

```coffee
# load and start server
station = require 'devtools-reloader-station'
station.start()
# trigger tab reload
station.reload 'pieces of url'
```

Here's how I use it in my project: https://gist.github.com/jiyinyiyong/10336012

Notice that you need [devtools-reloader-crx][crx] running in Chrome to use this.

[crx]: https://github.com/jiyinyiyong/devtools-reloader-crx

Or you may trigger reload event by yourself:

```coffee
net = require 'net'
pattern = 'http repo todolist'
# patterns = pattern.split(' ')
client = net.connect port: 8888, ->
  client.write 'pattern'
```

The Chrome Extension will find all tabs whose urls contain the patterns and reload them.

### License

MIT