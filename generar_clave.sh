#!/bin/sh

mkdir -p ~/.ssh && chmod 0700 ~/.ssh && ssh-keyscan "$1" >>~/.ssh/known_hosts 2>/dev/null

cd ~/.ssh || exit

rm -f id_rsa
rm -f id_rsa.pub

ssh-keygen -b 2048 -t rsa -f id_rsa -q -N ""
chmod 400 id_rsa

echo
echo "Clave pública generada:"
echo

cat id_rsa.pub
