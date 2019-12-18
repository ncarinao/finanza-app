# INTRODUCCIÓN

Aplicación para integrar sistema de saldos de clientes. Estas se obtienen mediante una API que informa los últimos movimientos de las cuentas de los clientes, y otra con la información del mismo.
Una vez consumidas, estos datos son persistidos en la BBDD de la aplicación.

## TECNOLOGÍA UTILIZADA

* Ruby 2.6.3
* SQLite 3
* Rails 6.0.1
* Whenever
* rest-client

## INSTRUCCIONES PARA EJECUTAR LA APLICACIÓN 

Para poder ejecutar esta aplicación se requiere antes que nada programar el schedule. Esto se hace ejecutando el siguiente comando: 
```
whenever --update-crontab --set environment=development
```
El archivo del schedule se encuentra dentro de:

[config/schedule.rb](config/schedule.rb)

Este actualmente esta programado para correr cada 5 minutos. Desde este se puede modificar el lapso para ejecutar la logica del consumo de la API. Esta funcionalidad se realizo con la gema **Whenever**.
Si se realiza alguna modificación en el schedule se debe volver a correr el comando para actualizar el crontab.

Los Endpoints son los siguientes: 
- api/clientes: Listado de todos los clientes.
- api/cliente/:codigo: Muestra lo que la información del cliente , y lo que ya ha cobrado y le falta por cobrar.
- api/transacciones: Listado de todas las transacciones agrupadas por cliente.

## POSIBLES MEJORAS Y COMENTARIO FINAL

A mejorar en esta aplicacion faltaron test que realicen una cobertura total del codigo. 
Dentro de [api_controller](app/controllers/api_controller.rb) se podría mejorar los estados de las respuestas de la API de la aplicación, además de realizar una autenticación para poder consumirlas.
En [cliente](app/models/cliente.rb) realice algunas validaciones dependiendo de las respuesta del API expuesta. Pero es un aspecto que se podría mejorar, además de no preestablecer los valor de la URI y del Token en el código.

Fue un muy lindo desafío y mas después de haber pasado tiempo sin desarrollar con Ruby. Me sirvió para aprender algunas cosas que desconocía.
