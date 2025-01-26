# dbdevcontainer-ifrn
- DevContainer Template para as disciplinas de Banco de Dados

## Executando o Docker Container localmente
$ docker-compose -f docker-compose.yml up

ou 

$ docker run --name db_server -e POSTGRES_PASSWORD=postgres -p 5433:5432 -d postgres