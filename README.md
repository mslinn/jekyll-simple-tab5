Jekyll Bootstrap 5 Tabs
[![Gem Version](https://badge.fury.io/rb/jekyll_bootstrap5_tabs.svg)](https://badge.fury.io/rb/jekyll_bootstrap5_tabs)
===========

The original version, written by Artur Gabitov, expected Markdown and Bootstrap 4.
[This version](https://rubygems.org/gems/jekyll_bootstrap5_tabs) requires Bootstrap 5 and HTML, not Markdown.


## Installation

Add this to your project's `Gemfile`:
```ruby
gem 'jekyll_bootstrap5_tabs'
```

Add this to your project's `_config.yml`:

```yaml
plugins:
  - jekyll_bootstrap5_tabs
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll-simple-tab5


## Usage

Bootstrap 5 is required.
One way to include Bootstrap 5 into a page within your project is to add the following HTML into the `<head/>` tag:
```html
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
```
...and add this to the bottom of the HTML file, within the `<body/>` tag:
```html
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
```

See this [working minimal Bootstrap 5 tab example](https://codepen.io/mslinn/pen/OJOjVPR)


## Two New Liquid Tags
The `jekyll_bootstrap5_tabs` plugin provides two new Liquid tags: `tabs` and `tab`.
Jekyll interprets the Liquid language when embedded into HTML pages.

For example, given the following content in a Jekyll page that has
[minimal front matter](https://jekyllrb.com/docs/front-matter/):
```
---
---
{% tabs demo %}
  {% tab demo#Home %}
    Home at last!
  {% endtab %}
  {% tab demo#Profile %}
    Profile meeee...
  {% endtab %}
  {% tab demo#Messages %}
    Messages - I have none
  {% endtab %}
{% endtabs %}
```
The outer tabs tag has a name: `demo`.
This name defines a namespace scope for the inner `tab` tags.
The inner `tab` tags reference the outer `tabs` tag (yes, this is redundant),
and introduces the name of the tab that it defines after the octothorpe (aka hash mark, number sign, and pound sign: #). A Bootstrap 5 tab is created for every `tab` tag, and the `id` for each `tag` is defined by the characters following the octothorpe.
This `id` is also displayed as the label for the `tab`, so if you want it capitalized a certain way, specify the tag capitalization in the `tab` tag.

The current implementation does not allow spaces within tab labels.
Instead, tab labels may only consist of one word each.

The `jekyll_bootstrap5_tabs` plugin will generate code similar to this:
```html
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" aria-current="page" href="#home">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" aria-current="page" href="#profile">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" aria-current="page" href="#messages">Messages</a>
  </li>
</ul>

<div class="tab-content">
  <div class="tab-pane active" id="home" aria-labelledby="home-tab">Home at last!</div>
  <div class="tab-pane" id="profile" aria-labelledby="profile-tab">Profile meeee...</div>
  <div class="tab-pane" id="messages" aria-labelledby="messages-tab">Messages - I have none</div>
</div>
```

![Image](docs/tab-screen.gif)


## Building

```shell
$ rake build jekyll_bootstrap5_tabs.gemspec
jekyll_bootstrap5_tabs 1.0.0 built to pkg/jekyll_bootstrap5_tabs-1.0.0.gem.
```

The most recently built gem is provided in `pkg/`.


## Installing

```shell
$ gem install pkg/jekyll_bootstrap5_tabs-1.0.0.gem
Fetching slim-4.1.0.gem
Fetching temple-0.8.2.gem
Successfully installed temple-0.8.2
Successfully installed slim-4.1.0
Successfully installed jekyll_bootstrap5_tabs-1.0.0
Parsing documentation for temple-0.8.2
Installing ri documentation for temple-0.8.2
Parsing documentation for slim-4.1.0
Installing ri documentation for slim-4.1.0
Parsing documentation for jekyll_bootstrap5_tabs-1.0.0
Installing ri documentation for jekyll_bootstrap5_tabs-1.0.0
Done installing documentation for temple, slim, jekyll_bootstrap5_tabs after 0 seconds
3 gems installed
```

Now go use the gem in a Jekyll project!


## Development

After checking out the repo, run `bin/setup` to install dependencies.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and the created tag,
and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mslinn/jekyll-bootstrap5-tabs.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
