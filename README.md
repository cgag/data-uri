## Installation
You can download the lastest release from github:
https://github.com/cgag/data-uri/releases

This build will only run on 64 bit linux or OSX.

## Usage
A command line tool to generate base64 encoded data-uris, usually used for embedding images in html or javascript.

```
data-uri --help
Usage: data-uri FILES... [--raw]
  Create data-uris from binary files. If the file is an image, CSS, or
  Javascript file, it will be wrapped in an approprate HTML tag. If you want
  just the raw base64 encoded string use the --raw option.

Available options:
  -h,--help                Show this help text
  --raw                    Don't wrap base64 encoding in HTML tags.
```

Output is separated by two new-lines:
```
aW1wb3J0IERpc3RyaWJ1dGlvbi5TaW1wbGUKbWFpbiA9IGRlZmF1bHRNYWluCg==

<img src="data:image/gif;base64,R0lGODlhBwALAKECAAAAAP///6g8e..." />
```
