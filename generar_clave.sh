#!/bin/bash

mkdir -p ~/.ssh && chmod 0700 ~/.ssh

cd ~/.ssh || exit

ssh-keyscan "$1" >~/.ssh/known_hosts 2>/dev/null

echo
if [ -s ~/.ssh/known_hosts ]; then
  echo "Fichero de claves conocidas actualizado para el host: $1"
else
  echo "ERROR: No se ha podido actualizar el fichero de claves conocidas del host: $1"
fi

if [ ! -f id_rsa ]; then
  ssh-keygen -b 2048 -t rsa -f id_rsa -q -N ""
  chmod 400 id_rsa
fi

echo
echo "Clave pública generada:"
echo

cat id_rsa.pub
