# thunderstore_downloader

Downloads and unzips thunderstore package versions and walks through each file within the folder to get its SHA256 hash.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     thunderstore_downloader:
       github: hostari/thunderstore_downloader
   ```

2. Run `shards install`

## Usage

```crystal
require "thunderstore_downloader"
```

## Contributing

1. Fork it (<https://github.com/your-github-user/thunderstore_downloader/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Pauline De Polonia](https://github.com/paula4230) - creator
- [Xavi Ablaza](https://github.com/xaviablaza) - maintainer
