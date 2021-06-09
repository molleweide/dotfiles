# GPG

## links

https://www.youtube.com/watch?v=DMGIlj7u7Eo
https://cerb.ai/guides/mail/gpg-setup-on-mac/
https://alexcabal.com/creating-the-perfect-gpg-keypair
https://gist.github.com/MorganGeek/5e6b89d351d34dfbc576db610b0c02e8
https://riseup.net/en/security/message-security/openpgp/best-practices
https://www.linuxbabe.com/security/a-practical-guide-to-gpg-part-1-generate-your-keypair
https://medium.com/@acparas/gpg-quickstart-guide-d01f005ca99
https://github.com/bfrg/gpg-guide
https://opensource.com/article/19/4/gpg-subkeys-ssh-manage

## neomutt

https://www.youtube.com/watch?v=2jMInHnpNfQ





# cerd macos guide https://cerb.ai/guides/mail/gpg-setup-on-mac/

## install

- `brew install gpg pinentry-mac`

- `echo "pinentry-program /usr/local/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf`

## generate master key

- `gpg --expert --full-generate-key`

    1. (8) set own capab..
    2. 

## set secure prefs

- `gpg --edit-key YOUR@email.com`
    
    `setpref SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed`

## add gpg subkey for XYZ

