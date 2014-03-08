
Devtools Reloader Station
------

### Installlation

```
npm install -g devtools-reloader-station
```

### Usage

```
devtools-reloader-station &
```

Notice that you need [devtools-reloader-crx][crx] running in Chrome to use this.

[crx]: https://github.com/jiyinyiyong/devtools-reloader-crx

After that, run this to trigger a page reloading event:

```
net = require 'net'
pattern = 'http repo todolist'
# patterns = pattern.split(' ')
client = net.connect port: 8888, ->
  client.write 'pattern'
```

The Chrome Extension will find all tabs whose urls contain the patterns and reload them.

### License

ISC