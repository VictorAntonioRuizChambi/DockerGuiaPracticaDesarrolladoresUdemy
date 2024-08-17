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
-d: Corre la imagen desenlazada de la consola donde se ejecutó el comando.
-p 8080:80: Mapea el puerto 8080 de nuestra computadora con el puerto 80 del contenedor
docker/getting-started: Imagen a utilizar

docker container run -d -p 8080:80 docker/getting-started

#Comando para detener un contenedor que se encuentra corriendo
docker container stop [container_id | container_name ]

#Comando corto para publicar un contenedor en el puerto 8080 en modo detached
docker container run -dp 8080:80 docker/getting-started

#Comando para iniciar un contenedor que se encuentra detenido
docker container start [container_id | container_name ]