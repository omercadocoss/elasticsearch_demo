# elasticsearch_demo
Demo de la funcionalidad básica de Elasticsearch, Kibana y AWS Elasticsearch Service

## Presentado
Abril 23, 2019 & 20 de Junio, 2019 | Querétaro Software Development Meetup

## Instancia local de Elasticsearch
El vagrantbox crea una instancia de Elasticsearch 7.0 en un Vagrant box local, listo para ser usado.
`
vagrant up --provision
` 
La información de cómo lo crea esta en un archivo de .sh que corre Vagrant:
`
scripts/vagrant/elasticsearch.sh
`
Y los queries usados en la primer parte de la presentación están en:
`
scripts/demo/demo.sh
`
### Requerimientos
- Vagrant > 2.2.0

## Aplicación de Symfony 4 para crear usuarios en AWS Elasticsearch Service / Elasticsearch local
Existe una aplicación de Symfony 4 que te permite mandar datos a tu AWS Elasticsearch Service o una instancia local,
lo unico que tienes que cambiar es la variable de:
`
 $esUrl = 'https://nombredetudomainenawselasticsearch:443';
`
en el archivo de ProfileApocalypseImportCommand.php y correr el comando con el número de perfiles que quieres crear en tu instancia:

`
$ php bin/console app:profile_apocalypse_import 10000000 
`

### Requerimientos
* PHP > 7.2
* Composer > 1.8 

### Setup
- Haz git clone del proyecto:
`
git clone https://github.com/omercadocoss/elasticsearch_demo.git
`

- Entra al folder:
`
cd elasticseach_demo
` 
- Instala las dependencias via composer:
`
composer install
`
- Cambia la variable de $esUrl (ve instrucciones arriba) y corre el comando


## Presentación de estos demos:
https://docs.google.com/presentation/d/1hU_3JBJoS69FGqbDxjbk6kfQHw31fxTHOUYVw-_37B4/edit#slide=id.g2462225b30_1_550
