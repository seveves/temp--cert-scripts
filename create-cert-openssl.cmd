@ECHO OFF
openssl genrsa -out openssl/private.pem 2048
openssl req -x509 -new -key openssl/private.pem -out openssl/public.pem -subj /C=US/O=TEST/CN=severinTestDevice
openssl pkcs12 -export -in openssl/public.pem -inkey openssl/private.pem -out openssl/certificate.pfx -password pass:Severin
PAUSE