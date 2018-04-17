# The TWA PFH5 Pack File Format

```
          |  00  01  02  03  |  04  05  06  07  |  08  09  0A  0B  |  0C  0D  0E 0F  |
00000000  |  preamble        |  bitmask         |  pf index len    |  pf index size  |
00000010  |  file index len  |  file index size |  timestamp       |  unknown        |
00000020  |  unknown         |  unknown         |  signature pos   |  unknown        |
00000030  |  index                                                                   |
[...]
00000XXX  | payload                                                                  |
[...]
00000YYY  | signature                                                                |
```

### preamble
`50464835` ("PFH5")

### bitmask
```
0x10000000 file is encrypted
0x01000000 index has unknown dword
```

### pf index len
?

### pd index size
?

### file index len
The amount of entries in the index

### file index size
The size of the index.

### timestamp
The time of creation (?).

### signature pos
The position of the 256-byte signature.

### index
The index is the concatenation of all index items.

### index item
An index item consists of 4 bytes file length, optional 4 bytes unknown if the flag is set, and a 0-terminated ascii string.

### payload

The concatenated content.

### signature

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
