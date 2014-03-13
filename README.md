A command line tool to generate base64 encoded data-uris, usually used for embedding images in html or javascript.  

Usage:

Download the data-uri binary from this repo (view file, right click on "raw" and save).

Input is any number of file names as command-line arguments.

`./data-uri file1 <file2> <file3>`

Output is new-line separated data-uris to standard out:

```
data:text/plain;base64,aW1wb3J0IERpc3RyaWJ1dGlvbi5TaW1wbGUKbWFpbiA9IGRlZmF1bHRNYWluCg==
data:image/gif;base64,R0lGODlhBwALAKECAAAAAP///6g8eKg8eCH5BAEKAAIALAAAAAAHAAsAAAITTIQYcLnsgGxvijrxqdQq6DRJAQA7
...
```
