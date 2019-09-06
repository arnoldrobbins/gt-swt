.hd crypt "exclusive-or encryption and decryption" 12/26/80
crypt [ <key> ]
.ds
'Crypt' encrypts data from its first standard input based upon
an encryption key supplied as an argument, and writes the result
on its first standard output.
.sp
'Crypt' uses a reversible "exclusive-or" algorithm so that cipher
text encrypted with a given key may be decoded using the same key.
.sp
If the <key> is omitted from the command, 'crypt' turns off
the terminal echo and prompts for the key from the terminal.
.es
sensitive_data> crypt bogus-key >safe_data
secret_message> crypt turkey
.me
"Key: " for a missing key
