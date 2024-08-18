#descargar una imagen llamada hello-world
docker pull hello-world

#ejecutar la imagen descargada
docker container run hello-world

comando para listar los contenedores
====================================
    **forma nueva
    =============
    docker container ls

    **forma antigua
    =============
    docker ps

#comando para listar todos los contenedores incluso los que se encuentran apagados
docker container ls -a

#Comando para eliminar o remover un contenedor
docker container rm [id_container | nombre_container ]

#Comando para eliminar o remover un contenedor de forma forzada
docker container rm -f [id_container | nombre_container ]

#Comando para eliminar o remover varios contenedores a la vez
docker container rm [id_container | nombre_container ] [id_container | nombre_container ] ...

#Comando para eliminar o remover varios contenedores a la vez de forma forzada
docker container rm -f [id_container | nombre_container ] [id_container | nombre_container ] ...

#Comando para eliminar o remover todos los contenedores detenidos
docker container prune

#Comando para eliminar o remover una imagen
docker image rm [image_id | image_name ]

#Comando para correr un contenedor en el puerto 80 con el modo dechated, es decir en el backgroud con la imagen "getting-started"
# -d: Corre la imagen desenlazada de la consola donde se ejecutó el comando.
# -p 8080:80: Mapea el puerto 8080 de nuestra computadora con el puerto 80 del contenedor
docker/getting-started: Imagen a utilizar

docker container run -d -p 8080:80 docker/getting-started

#Comando para detener un contenedor que se encuentra corriendo
docker container stop [container_id | container_name ]

#Comando corto para publicar un contenedor en el puerto 8080 en modo detached
docker container run -dp 8080:80 docker/getting-started

#Comando para iniciar un contenedor que se encuentra detenido
docker container start [container_id | container_name ]

#Comando para levantar un contenedor de postgres especificando variables de entorno
# --env: variable de entorno, para levantar postgre se tiene que especificar
#        la variable de entorno POSTGRES_PASSWORD
# -e: variable de entorno(comando abreviado)
docker container run --name somepostgres -e POSTGRES_PASSWORD=nysecretpassword -d postgres

#Comando para levantar un contenedor de postgres especificando variables de entorno
#y habilitando el puerto 5355 de mi máquina para que a través de el se comunique
# con el puerto 5432 del contenedor.
docker container run --name somepostgres -dp 5355:5432 -e POSTGRES_PASSWORD=nysecretpassword postgres

# Para escribir comandos muy largos y quere hacer uso de saltos de linea
# se debe utilizar los siguientes caracteres dependiendo del Sistema Operativo
Linux o Mac: se utiliza el caracter backSlash "\"
Windows: se utiliza el caracter backTip "`"

#Se debe tener en cuenta que si se especifica un nombre en la creación de un contenedor
#este no se debe repetir con el nombre de otro contenedor que se haya desplegado en 
#tu computadora.

#Se debe tener en cuenta que si se ha especificado el número de un puerto en tu local
# para que se comunique con un contenedor, al desplegar otro contenedor, no se puede
# especificar el mismo puerto de tu máquina local porque ese puerto ya estaría en uso
# por el primer contenedor desplegado.

#Comando para mostrar log de un contenedor
# --follow: seguir los nuevos logs mostrados
# -f: seguir los nuevos logs mostrados(comando abreviado)
docker container logs [container_id]
docker container logs --follow [container_id]
docker container logs -f [container_id]

#comando para crear un contenedor de mariaDB con nombre world-db 
#basado en la imagen mariadb:jammy que se pueda acceder a través
#del puerto 3307 de mi máquina local, especificando las variables de entorno
docker container run --name world-db -dp 3307:3306 \
-e MARIADB_USER=example-user \
-e MARIADB_PASSWORD=user-password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
mariadb:jammy


#Comando para crear un volumen
docker volume create [volume_id | volume_name]

#Comando para listar los volumenes
docker volume ls

#Comando para inspeccionar o ver el detalle de un volumen
docker volume inspect [volume_id | volume_name]

#comando para crear un contenedor de mariaDB con nombre world-db 
#basado en la imagen mariadb:jammy que se pueda acceder a través
#del puerto 3307 de mi máquina local, especificando las variables 
#de entorno y definiendo un volumen que se sincronize con la 
#dirección de mi máquina local path_host:path_container
docker container run --name world-db -dp 3307:3306 \
-e MARIADB_USER=example-user \
-e MARIADB_PASSWORD=user-password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
--volume mi-volume-world-db:/var/lib/mysql \
mariadb:jammy

#comando para crear un contenedor de phpmyAdmin con nombre phpmyadmin 
#basado en la imagen phpmyadmin:5.2.0-apache que se pueda acceder a través
#del puerto 8080 de mi máquina local, especificando las variables 
#de entorno
docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITRARY=1 \
-p 8080:80 \
phpmyadmin:5.2.0-apache