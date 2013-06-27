AES256 encryption with Tcl
==========================

Two simple scripts to encrypt and decrypt files using aes256. The scripts are based on aes.tcl, the Tcl implementatiom of aes part of tcllib.

    encrypt.tcl 
    decrypt.tcl

encrypt.tcl is used to encrypt files.

    [ moustache@antil0p ] ~/code/aes256tcl > ./encrypt.tcl

    encrypt.tcl scripts requires two arguments

To encrypt a file specify the input file and the output file as such:

    [ moustache@antil0 cat example/input.dec
    This is a top secret file!

    [ moustache@antil0p ] ~/code/aes256tcl > ./encrypt.tcl example/input.dec example/output.enc
    Key: e1a841b7ce49f11ffebb15a2dccbc25803b0d6530cc9b0676b54346cc3ab0e82
    IV: d01d770da9e0c2cddc9168661a75f6f0

    [ moustache@antil0p ] ~/code/aes256tcl > ll example/
    total 8
    -rw-rw-r-- 1 moustache moustache 27 2013-06-27 14:07 input.dec
    -rw-rw-r-- 1 moustache moustache 32 2013-06-27 14:16 output.enc
    
    [ moustache@antil0p ] ~/code/aes256tcl > cat example/output.enc
    �wÐZ�Y�Ç¿½�B��6~�<d��#l�

The Key and IV are displayed and will be needed for decryption.

decrypt.tcl is used to decrypt files. 

    [ moustache@antil0p ] ~/code/aes256tcl > ./decrypt.tcl

    decrypt.tcl scripts requires four arguments

    <input file> <output file> <key> <IV>

To decrypt a file specify the input file, the output file, the key and the iv as such:

    [ moustache@antil0p ] ~/code/aes256tcl > ./decrypt.tcl example/output.enc example/output.dec e1a841b7ce49f11ffebb15a2dccbc25803b0d6530cc9b0676b54346cc3ab0e82 d01d770da9e0c2cddc9168661a75f6f0
    [ moustache@antil0p ] ~/code/aes256tcl > cat example/output.dec
    This is a top secret file!


Notes about OpenSSL
-------------------

Todo
