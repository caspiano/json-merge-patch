# JSON Merge Patch

Implementation of JSON Merge Patch [RFC7396](https://www.rfc-editor.org/rfc/rfc7396.html)

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  json-merge-patch:
    github: caspiano/json-merge-patch
```

2. Run `shards install`

## Usage

### Via Module

```crystal
require "json-merge-patch"

a = JSON.parse %({"hi": 1, "bye": 1})
b = JSON.parse %({"hi": 2, "bye": 2})

# use the module scope
puts JSON::Any::MergePatch.merge(a, b).to_json # => {"hi": 2, "bye": 2}
puts JSON::Any::MergePatch.merge(b, a).to_json # => {"hi": 1, "bye": 1}

# or...
puts JSON::RFC7396.merge(a, b).to_json # => {"hi": 2, "bye": 2}
puts JSON::RFC7396.merge(b, a).to_json # => {"hi": 1, "bye": 1}
```

### Via `require "json-merge-patch/ext"`

```crystal
require "json-merge-patch/ext"

a = JSON.parse %({"hi": 1, "bye": 1})
b = JSON.parse %({"hi": 2, "bye": 2})

# The module methods are included in addition to instance methods on `JSON::Any`
puts a.merge(b) # => {"hi": 2, "bye": 2}
puts b.merge(a) # => {"hi": 1, "bye": 1}
```

## Contributing

1. [Fork it](https://github.com/caspiano/json-merge-patch/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Caspian Baska](https://github.com/caspiano) - creator and maintainer
