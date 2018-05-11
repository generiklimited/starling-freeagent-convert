# Starling Transactions to FreeAgent

This is a simple ruby script which takes CSV statement exported from Starling Bank 
and creates a QIF file compatible with FreeAgent

Not associated with any of the parties listes above.
Provided as is, under GPL v2.

## Usage

Assuming that you know Docker

### Build an image

```
docker build -t generik/csvToQIF .
```

### Convert a file

Assuming that you are in a directory with the file and it's called `StarlingStatement_May-2018.csv`

```
docker run --rm -v $PWD:/data generik/csvToQIF StarlingStatement_May-2018.csv
```

this will create a `StarlingStatement_May-2018.qif` file in the same directory
