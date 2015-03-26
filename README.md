# InfluxDB

[![build status][travis-image]][travis-url]

Install and configure the [InfluxDB](http://influxdb.com/) service.


## Available States

#### ``influxdb``

Installs InfluxDB from the provided packages. Uses the InfluxDB [provided packages](http://influxdb.com/download/).

#### ``influxdb.cli``

Installs the [influxdb-cli](https://github.com/phstc/influxdb-cli) gem system wide.

## Testing

Testing is done with [kitchen-salt](https://github.com/simonmcc/kitchen-salt).

Install it via bundler:

```
bundle
```

Then run test-kitchen with:

```
kitchen converge
```

Make sure the tests pass:

```
kitchen verify
```

## Author

[Alfredo Palhares](https://github.com/masterkorp) \<afp@seegno.com\>

[travis-image]: https://travis-ci.org/seegno/influxdb-formula.svg
[travis-url]: https://travis-ci.org/seegno/influxdb-formula
