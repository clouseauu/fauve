# Fauve

[![Build Status](https://travis-ci.org/clouseauu/fauve.svg?branch=master)](https://travis-ci.org/clouseauu/fauve)
[![Code Climate](https://codeclimate.com/github/clouseauu/fauve/badges/gpa.svg)](https://codeclimate.com/github/clouseauu/fauve)
[![Test Coverage](https://codeclimate.com/github/clouseauu/fauve/badges/coverage.svg)](https://codeclimate.com/github/clouseauu/fauve)
[![Dependencies](https://gemnasium.com/clouseauu/fauve.svg)](https://gemnasium.com/clouseauu/fauve)

Fauve is a Rails/Sass gem to help you manage your app's colour schemes.

Have you had to scour through a sizeable app's CSS/SCSS/Sass files to change hard-coded colour hex values because you're re-branding? Have you ended up with a `colors.sass` or similar file with 1000 lines of variables? Solving this problem is Fauve's _raison d'être_.

## The basic premise

As a rule of thumb, you want to work with about five colours when selecting a scheme. You can have fewer, but when you have _too many_, that's when maintenance becomes nightmarish.

Fauve allows you to have a basic set of colours and define variations to use in different scenarios.

## Usage

1. Add a `fauve.yml` file under `config` in your rails app:

```yaml
---
scheme:
- '#131210'
- '#c05d33'
- '#e5b455'
- '#3c8399'
- '#d8ccb2'

links:
  main_text:      scheme[1]
  main_hover:     scheme[1]

buttons:
  main_bg:        scheme[3]
  main_text:      scheme[0]
  success_bg:     scheme[3]

odd_case:
  main:           '#4de3ef'
```

2. Reference the colours in your SCSS/Sass files by calling the `fauve` function, passing `section` and `key`:

```sass
.button
  background: fauve(buttons, main_bg)
  color: fauve(buttons, main_text)
  padding: 20px
  ...
```

You can also use number keys to reference your colours if you use Array syntax, so the config file above references `scheme` as:

```sass
.button
  background: fauve(scheme, 3)
  color: fauve(scheme, 2)
  padding: 20px
  ...
```

Furthermore, you may add any number of Sass colour filters using the following syntax:

```sass
.button
  background: fauve(buttons, main_bg, $darken: 20, $rgba: .5)
  color: fauve(buttons, main_text, $lighten: 5)
  padding: 20px
  ...
```


## Installation

Add this line to your application's Gemfile:

    gem 'fauve'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fauve


## TODO

- [ ] Allow filtering (colour mixing) in yaml file
- [ ] Generate colour scheme page
- [ ] [Combustion](https://github.com/pat/combustion) testing
- [ ] Rationale as to why this is a better approach to SassScript Maps
- [ ] A logo


## License ([MIT](https://en.wikipedia.org/wiki/MIT_License))

Copyright (c) 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
