# The TWA PFH5 Replay File Format

## Filename

`battle_live_{YEAR}-{MONTH}-{DAY}_{HOUR}-{MINUTE}-{SECOND}.twareplay`

## Header

So far these are only educated guesses.
```
          |  00  01  02  03  |  04  05  06  07  |  08  09  0A  0B  |  0C  0D  0E  0F  |
00000000  |  CA  AB  00  00  |  00  00  00  00  |  Timestamp       |  XX  XX  01  00  |
00000010  |  80  00  00  03  |  unknown         |  00  00  00  00  |  0F  01  00  00  |
00000020  |  00  0F  02  00  |  00  00  82  01  |  84  XX  XX  A0  |  02  00  24  84  |
00000030  |  XX  XX  82  03  |  02  16  B4  0F  |  03  00  00  00  |  13  C0  04  84  |
00000040  |  XX  XX  02  82  |  XX  XX  0C  8C  |  82  XX  XX  C0  |  06  82  XX  XX  |
```
