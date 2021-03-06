# Advanced Samvera Camp 2018 Team 2 code repo

[![Build Status](https://travis-ci.org/RepoCamp/ascteam2.svg?branch=master)](https://travis-ci.org/RepoCamp/ascteam2)
[![Coverage Status](https://coveralls.io/repos/github/RepoCamp/ascteam2/badge.svg?branch=add-coveralls-support)](https://coveralls.io/github/RepoCamp/ascteam2?branch=add-coveralls-support)

<p>
  <img width="200px" src="https://media.giphy.com/media/l3vRgqJIdbRp7Exfa/source.gif" />
</p>


We encourage particpation from throughout the library and opensource communities.  In order to ensure that everyone can enjoy a safe, welcoming, and resprectful enviornment, please familiarize yourself with the [Samvera Community Code of Condct](https://wiki.duraspace.org/display/samvera/Code+of+Conduct).

<img align='right' height='100px' src='http://camp.curationexperts.com/sample-assets/DCE-Sm-Square.png' />

For more information on how to use this repository, please visit the [WIKI](https://github.com/RepoCamp/asc2018/wiki).

## Development Setup

First, ensure you can checkout the project and run the test suite:

```sh
$ git clone https://github.com/RepoCamp/asc2018.git camping; cd camping
$ bundle install
$ bin/rails ci
```

You should see a single passing test.

Review the [Hyrax prerequisites](https://github.com/samvera/hyrax/#prerequisites). You will need to have items 4--7 installed locally (Solr, Fedora, and SQLite are provided).

Now try standing up the development server. Make sure Redis is running (`$ redis-server`) and then do:

```sh
$ bin/rails hydra:server
```

And in a separate terminal:

```sh
$ bin/rails db:setup
$ bin/rails hyrax:default_admin_set:create
```

Make sure you have Redis running (in another separate terminal):

```sh
$ bundle exec redis-server
```

By default we are using Sidekiq in the development environment for background
jobs. You'll need to have it running in another tab:

```sh
sidekiq
```

At this point, you should be able to browse to `http://localhost:3000`, create a new user and deposit an item.
