# Crystal Seek { cs }

Crystal Seek is another `ls` a like command.

## Installation

Download the binaries in the [Release Page](https://github.com/Jeddi212/cs/releases)🏷️.

*or*

### From source

> Make sure **crystal** & **shards** is installed

- Clone this project
- `cd ./cs`
- Then run this command

| Using Crystal | Using Shards |
|---|---|
|`crystal build ./src/cs.cr` | `shards build`|

> ( optional arguments `--release --no-debug` )

Then, add the binaries to your PATH environment

## Usage

### Scoped feature:
| Short | Long | Description |
|---|---|---|
| -h | --help | Display help page |
| -c | --color | Use colorized output |
| -s | --slash | Append slash on directory |
| -t | --tab | Use tabular output |

Example:
```
cs -t -s -c

Use tabular output
Append slash behind the directories
Use coloring for the directories

1 Directory gonna be listed and printed out (current directory)
```

```
cs ~ ../ /usr/bin

Use grid output
3 directories gonna be listed and printed out ("~", "../", "/usr/bin")
NOTE: ~ gonne be substituted by your home directory
```


## Development

~

## Contributing

1. Fork it (<https://github.com/Jeddi212/cs/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jeddi212](https://github.com/Jeddi212) - creator and maintainer

<hr>
  
![Jeddi's Profile Views](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2FJeddi212&countColor=%23fce775&style=flat-square)
