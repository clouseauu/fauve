# Monet

Monet is a Rails/Sass gem to help you manage your app's colour schemes.

Have you had to scour through a sizeable app's CSS/SCSS/Sass files to change hard-coded colour hex values because you're re-branding? Have you ended up with a `colors.sass` or similar file with 1000 lines of variables? Solving this problem is Monet's _raison d'être_.

## The basic premise

As a rule of thumb, you want to work with about five colours when selecting a scheme. You can have fewer, but when you have _too many_, that's when maintenance becomes nightmarish.

Monet allows you to have a basic set of colours and define variations to use in different scenarios.

## Usage

1. Add a `monet.yml` file under `config` in your rails app:

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
  main_hover:     scheme[1], lighten=10

buttons:
  main_bg:        scheme[3]
  main_text:      scheme[0]
  success_bg:     scheme[3], darken=10, hue=20

odd_case:
  main:           '#4de3ef'
```

2. Reference the colours in your SCSS/Sass files by calling the `monet` function, passing `section` and `key`:

```sass
.button
  background: monet(buttons, main_bg)
  color: monet(buttons, main_text)
  padding: 20px
  ...
```

You can also use number keys to reference your colours, so the example above can also be written like so:

```sass
.button
  background: monet(buttons, 0)
  color: monet(buttons, 1)
  padding: 20px
  ...
```

Furthermore, you may add any number of Sass colour filters using the following syntax:

```sass
.button
  background: monet(buttons, main_bg, $darken: 20, $rgba: .5)
  color: monet(buttons, main_text, $lighten: 5)
  padding: 20px
  ...
```


## Installation

Add this line to your application's Gemfile:

    gem 'monet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monet

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
