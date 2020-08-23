# The TWA PFH5 Pack File Format

This document describes what we know about the PackFile format used by Total War Games. Each PackFile is divided in three parts: header, indexes and data (and signature if the PackFile is encrypted).

## Header

```
          |  00  01  02  03  |  04  05  06  07  |  08  09  0A  0B  |  0C  0D  0E 0F  |
00000000  |  Preamble        |  Type + Bitmask  |  PF Index Count  |  PF Index Size  |
00000010  |  File Index Cou. |  File Index Size |  Timestamp       |  Unknown        |
00000020  |  Unknown         |  Unknown         |  Signature Pos.  |  Unknown        |
```

### Preamble
`50464835` ("PFH5")

### Type + Bitmask
Type of the PackFile, being:

* 0 -> Boot.
* 1 -> Release.
* 2 -> Patch.
* 3 -> Mod.
* 4 -> Movie.

Here is usually included a bitmask, being:
```
0001 0000 0000 HAS_BIG_HEADER                     -> Header has 20 extra bytes (TW: Arena).
0000 1000 0000 HAS_ENCRYPTED_INDEX                -> File index is encrypted.
0000 0100 0000 HAS_INDEX_WITH_TIMESTAMPS          -> File index entries have a timestamp after the size.
0000 0001 0000 HAS_ENCRYPTED_CONTENT              -> Files are padded to multiples of 8.
```

### PF Index Count
Amount of entries in the PackFile Index.

### PF Index Size
Size in bytes of the PackFile Index.

### File Index Count
Amount of entries in the File Index (amount of files in the PackFile).

### File Index Size
S##ize in bytes of the File Index.

### Timestamp
The time of creation of the PackFile (probably).

### Signature Position (if encrypted).
The position of the 256-byte signature.

## Indexes

### PackFile Index
The PackFile Index is a list of PackFiles, each one ended in 00. Not seen used in Arena.

### File Index
The File index is a list containing the size, timestamp (if the correct bitmask is set in the header) and path of each file inside the PackFile. Every entry is set like this:
```
          |  00  01  02  03  |  04  05  06  07  |  08  09  0A  0B  |  0C  0D  0E 0F  |
0000XXXX  |  Data Size       |  Timestamp       |  File Path, ended in 00            |
```
* Data Size is the size in bytes of the data of the File.
* Timestamp is a creation/modification date, not sure. Only present when the right bitmask is set in the header.
* File Path, is a path like this: ```db/kv_tables/table```

The File Index may be encrypted, depending on the bitmask used in the header.

## Data
The data of every file inside the PackFile, in the same order the files are in the File Index.

## Signature (only in encrypted PackFiles)

You can validate the integrity of the file with TCA's public key:
```
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqezQiuqE/ll7IDWhqhpy
r/QG2YbkSBZ0FwbTGdtK1u0oDifFwJFwWKL4XHQtDR4DNZexwrSota5QHSiBphBk
xeJv90L0Dgyh0R0tro8xFpSzjs7jFYtu+Kbfu9AiA9jOOMhMgG0GL+LRcb3Rka9s
wf2Q8nOPHhcYk/nvpJ/lFeR2CmoF/M2GxRbfSv4/9eGi4qtuGBDSdKY4QcpVV3xW
wiPzpEutu3y9hytdzxUydtEXcisMTux//Nsu3U5h/X9LHUZ6UOBT2IT8fmtvIv5K
z1y+IJ16eD3bV985AB16vOIHsYzbWy+KG4YeRaWOCuudekpH6+4AC506momN4vtc
EwIDAQAB
-----END PUBLIC KEY-----
```

