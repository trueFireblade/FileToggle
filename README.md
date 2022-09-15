# FileToggle

A toggle menu for toggling things by moving files between two directories(e.g. toggle userscripts in qutebrowser)

## Installation

* Ensure [Crystal](https://crystal-lang.org/) and [Shards](https://github.com/crystal-lang/shards) are installed.
```bash
$ git clone https://www.github.com/trueFireblade/FileToggle
$ cd FileToggle
```
[Configure](#configuration) to your likings*(This step is neccessary!)*
```bash
$ shards build
```

## Configuration
Change the configuration in `src/config.cr`
* ActiveDir: The absolute path to the directory considered active
* PassiveDir: The absolute path to the directory considered passive
* Width: The width of the TUI in Chars
* Height: The height of the TUI in lines

## Usage
```
$ ./bin/filetoggle
```
U will see a list of all files in both directories, If the checkbox is filled the file is in the `ActiveDir` if not it is in `PassiveDir`
* Scroll up with `K` or `arrow_up`
* Scroll down with `J` or `arrow_down`
* Toggle active with `Space`
* Quit with `Q` or `Ctrl+C`

## Contributors

- [trueFireblade](https://github.com/trueFireblade) - creator and maintainer
