# jenkins-docker

Servidor [Jenkins](https://www.jenkins.io) en un contenedor Docker.

## Funcionamiento

1. Añadir una entrada al fichero de hosts::

   ```text
   127.0.0.1	jenkins.test
   ```

2. Configurar el fichero `.env`.

3. Arrancar los contenedores:

    ```shell
    make start
    ```

4. Acceder al servidor [Jenkins](https://jenkins.test).

> Para obtener el token que pide en la pantalla inicial, usar el comando `make logs` para ver el log del contenedor.

## Referencias

- [Instrucciones de instalación](https://www.jenkins.io/doc/book/installing/docker/) de Jenkins para Docker.
- [Imagen de contenedor Docker](https://github.com/jenkinsci/docker-inbound-agent) para crear agentes distribuidos.
