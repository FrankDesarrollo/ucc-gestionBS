docker ps
docker run hello-world
git --version
git config --global user.name "Frank David Palma"
git config --global user.email "frank.palma@campusucc.edu.co"
git config --list
ssh -T git@github.com
ssh-keygen -t ed25519 -C "gamernoban06@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
cd ~
mkdir ucc-gestionBS
cd ucc-gestionBS
git init
git remote add origin git@github.comFrankDesarrollo/ucc-gestionBS.git
git remote -v
echo "# UCC Gestión de Bases de Datos" > README.md
git add .
git commit -m "Primer commit - Creación del repositorio"
git branch -M main
git push -u origin main
git@github.com:FrankDesarrollo/ucc-gestionBS.git
git remote remove origin
git remote add origin git@github.com:FrankDesarrollo/ucc-gestionBS.git
git remote -v
git push -u origin main
docker --version
sudo apt update && sudo apt upgrade -y
cd ..
sudo apt install -y ca-certificates curl gnupg
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl status docker
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update && sudo apt upgrade -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
docker --version
docker ps
sudo systemctl enable docker
sudo systemctl start docker
docker run hello-world
sudo usermod -aG docker $USER
newgrp docker
sudo docker pull container-registry.oracle.com/database/enterprise
docker search oracle
docker pull gvenzl/oracle-xe
docker pull postgres
docker pull mcr.microsoft.com/mssql/server
psql -U postgres -c "SELECT pg_is_in_recovery();"
sudo apt install postgresql-client-common
psql -U postgres -c "SELECT pg_is_in_recovery();"
sudo apt update
sudo apt install postgresql-client
psql --version
psql -U postgres -c "SELECT pg_is_in_recovery();"
sudo apt install postgresql-client-14
sudo systemctl status postgresql
sudo systemctl start postgresql
sudo apt install postgresql
sudo mkdir -p /var/run/postgresql
sudo chown postgres:postgres /var/run/postgresql
sudo systemctl restart postgresql
sudo netstat -plnt | grep 5432
sudo -u postgres pg_ctlcluster 16 main start
sudo systemctl restart postgresql
top -u postgres
sudo systemctl enable postgresql
sudo -u postgres createuser --interactive
sudo nano /etc/postgresql/12/main/postgresql.conf
sudo apt update
sudo apt install docker-compose -y
docker-compose --version
cd ucc-gestionBS/
mkdir mi-proyecto && cd mi-proyecto
code .
docker-compose --version
sudo systemctl status docker
wsl
docker compose up -d
sudo usermod -aG docker $USER
newgrp docker
code .
docker --version
docker ps
docker compose up -d
cd ucc-gestionBS/
docker compose up -d
code .
ls -l
mv Docker-Compose.yml docker-compose.yml
docker compose up -d
mkdir mi-proyecto && cd mi-proyecto
code .
pwd
ls -l
cd mi-proyecto
docker compose up -d
nano docker-compose.yml
ls -l
docker compose up -d
code .
sudo netstat -tulnp | grep 5432
sudo lsof -i :5432
sudo systemctl stop postgresql
sudo systemctl disable postgresql  # Evita que inicie automáticamente
docker compose up -d
docker ps
code .
docker compose up -d
docker compose up --build -d
docker ps
docker ps -a
flask
psycopg2
sudo apt install python3-flask
mkdir app
docker compose up -d
docker compose down
cd ucc-gestionBS/
code .
docker compose up --build -d
sudo netstat -tulnp | grep 5432
docker compose down
docker compose up --build -d
docker compose down
docker network prune -f
sudo systemctl restart docker
docker compose up --build -d
sudo systemctl restart docker
sudo systemctl status docker
docker network prune -f
docker network rm $(docker network ls -q)
docker ps
docker compose up --build -d
docker ps
docker network ls
docker network rm $(docker network ls -q | grep -v 'bridge\|host\|none')
docker network ls --format "{{.ID}}" | xargs docker network rm
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker compose up --build -d
docker logs ucc-gestionbs-web-1
docker ps
cat app/requirements.txt
echo "flask" > app/requirements.txt
echo "psycopg2" >> app/requirements.txt
cat app/requirements.txt
docker compose down
docker compose up --build -d
docker compose down
docker compose up --build -d
docker logs ucc-gestionbs-web-1
ls -l app/
cat app/requirements.txt
docker compose down
docker compose up --build -d
docker logs ucc-gestionbs-web-1
mkdir app
touch app/app.py app/requirements.txt
docker compose up --build -d
docker logs ucc-gestionbs-web-1
docker compose up -d
docker compose down
docker compose down
docker compose up --build -d
mkdir -p ucc-gestionBS/html
cd ucc-gestionBS
nano docker-compose.yml
nano html/index.html
cat html/index.html
mkdir -p ucc-gestionBS/mysql_data
cd ucc-gestionBS
nano docker-compose.yml
version: "3.8"
services:
docker compose up -d
docker ps
docker exec -it mysql_server mysql -u root -p
docker compose down
docker compose up -d
docker exec -it mysql_server mysql -u root -p
docker compose down
nano docker-compose.yml
docker compose up --scale web=3 -d
docker ps
docker compose down
docker rm -f $(docker ps -aq)
docker compose down
docker rm -f $(docker ps -aq)
docker ps
docker network prune -f
docker volume prune -f
nano docker-compose.yml
docker compose up --scale web=3 -d
docker ps
docker compose down
docker network prune -f
docker volume prune -f
docker rm -f $(docker ps -aq)
docker compose up --scale web=3 -d
git add .
sudo chmod -R 777 ucc-gestionBS/mysql_data/
git add .
git commit -m "Sesion 3 - Docker Compose"
git push -u origin main
cd ucc-gestionBS/
code .
cd ..
mkdir -p ucc-gestionBS/app
cd ucc-gestionBS
pwd
code .
git add .
docker ps
docker stop $(docker ps -aq)
docker rm -f $(docker ps -aq)
docker ps -a
docker network prune -f
docker volume prune -f
docker ps -a
docker network ls
docker volume ls
docker-compose up -d
docker ps
docker-compose down
docker-compose down -v
docker stop postgres_db
docker rm postgres_db
docker ps
docker-compose up -d
docker ps
docker-compose down
docker-compose down -v
docker network prune -f
docker ps
docker-compose up -d
docker ps
docker-compose down
docker network prune -f
docker-compose down -v
docker network prune -f
docker ps
docker-compose up -d
docker ps
docker exec -it postgres_master psql -U admin -d mydatabase
docker exec -it postgres_replica psql -U admin -d mydatabase
docker ps
docker ps -a
docker-compose up -d
docker ps
docker exec -it postgres_master psql -U admin -d mydatabase
docker ps -a
docker logs postgres_replica
docker stop postgres_replica
docker rm postgres_replica
docker volume rm postgres_replica_data
docker volume ls
docker volume rm postgres_replica_data
sudo rm -rf ~/ucc-gestionBS/postgres_replica_data
docker-compose up -d replica
docker ps
docker exec -it postgres_master psql -U admin -d mydatabase -c "SELECT * FROM pg_stat_replication;"
docker-compose down
docker stop postgres_master postgres_replica
docker rm postgres_master postgres_replica
docker volume rm $(docker volume ls -q)
docker-compose up -d
docker ps
docker stop postgres_replica
docker rm postgres_replica
docker volume rm postgres_replica_data
docker ps
docker ps -a
docker ps
docker-compose down -v
docker volume rm $(docker volume ls -q)
docker-compose up -d postgres_primary
docker exec -it postgres_primary psql -U user -d postgres
docker ps -a
docker exec -it ucc-gestionbs_postgres_primary_1 psql -U user -d postgres
docker-compose up -d postgres_replica
docker ps
docker-compose down -v
docker system prune -f
docker volume prune -f
docker ps
docker-compose up -d
docker ps
git init
git add .
git commit -m "Configuración de PostgreSQL con múltiples bases de datos"
git branch -M main
git push -u origin main
docker down
docker-compose down -v
cd ucc-gestionBS/
code .
docker-compose up -d
docker ps
docker exec -it postgres_db psql -U user -d bank_db
docker exec -i postgres_db psql -U user -d bank_db < /path/to/init.sql
docker cp init.sql postgres_db:/init.sql
docker exec -it postgres_db psql -U user -d bank_db -f /init.sql
\dt
docker exec -it postgres_db psql -U user -d bank_db
docker-compose down -p
docker-compose down
docker-compose up -d
docker ps
docker-compose down
docker volume rm ucc-gestionBS_postgres_data
docker volume ls
docker volume rm ucc-gestionBS_postgres_data
docker volume prune -f
docker-compose up -d
docker ps
docker exec -it postgres_db_airport psql -U user
docker exec -it postgres_db psql -U user
docker-compose down
docker volume rm ucc-gestionBS_postgres_data
docker volume prune -f
docker volume ls
docker volume rm ucc-gestionbs_postgres_data
docker volume prune -f
docker volume ls
docker-compose up -d
docker ps
docker-compose up -d
docker-compose --version
docker-compose down --volumes
docker system prune -af
docker volume prune -f
docker-compose up -d --force-recreate --build
docker ps
docker cp init.sql postgres_db_airport:/init.sql
docker-compose down
docker-compose up -d --force-recreate --build
docker exec -it postgres_db_airport psql -U user -d airport_db
docker cp init.sql postgres_db_airport:/init.sql
docker exec -it postgres_db_airport psql -U user -d airport_db
git add .
ls
git commit -m "Examen primer momento"
git push
docker-compose down
cd ucc-gestionBS/
code .
ls
mkdir milton_momento
cd milton_momento
ls
code .
docker-compose up -d
ls
docker ps
docker-compose down
docker-compose up -d
docker ps
docker-compose down
docker-compose up --build -d
docker-compose down
docker-compose up -d
docker ps
docker ps -a
docker a6ed1029d14c
docker rm a6ed1029d14c
docker compose down a6ed1029d14c
docker rm a6ed1029d14c
docker stop aeropuerto_postgres
docker rm a6ed1029d14c
docker-compose up -d
docker stop postgres_db_airport
docker rm postgres_db_airport
docker ps
docker stop aeropuerto_postgres
docker rm aeropuerto_postgres
docker ps
docker-compose up -d
docker stop aeropuerto_postgres
docker rm aeropuerto_postgres
docker-compose up -d
docker exec -it aeropuerto_postgres psql -U admin -l
docker exec -it aeropuerto_postgres psql -U admin -c "CREATE DATABASE aeropuerto_db;"
docker exec -it aeropuerto_postgres psql -U admin -d postgres
docker exec -it aeropuerto_postgres psql -U admin -d postgres -c "\l"
docker-compose up -d
docker-compose down --volumes
docker system prune -a
docker-compose up -d
docker ps
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume prune -f
docker network prune -f
docker system prune -a -f
docker-compose up -d
docker-compose down
docker volume rm postgres_data
docker-compose up -d
docker exec -it postgres_db psql -U user -d world
ls -l init.sql
docker exec -it postgres_db ls /docker-entrypoint-initdb.d/
docker-compose down
docker-compose up -d
docker-compose down
ls -l
docker-compose down
docker volume rm postgres_data
docker-compose up -d
docker exec -it postgres_db psql -U user -d world
mv inti.sql init.sql
docker-compose down
docker volume rm postgres_data
docker-compose up -d
docker exec -it postgres_db ls /docker-entrypoint-initdb.d/
docker cp init.sql postgres_db:/docker-entrypoint-initdb.d/init.sql
docker exec -it postgres_db psql -U user -d world
docker exec -it postgres_db psql -U user -f /docker-entrypoint-initdb.d/init.sql
docker exec -it postgres_db psql -U user -c "CREATE DATABASE world;"
docker exec -it postgres_db psql -U user -d world -f /docker-entrypoint-initdb.d/init.sql
docker-compose down -v
docker-compose up -d
docker exec -it postgres_db psql -U user -f /docker-entrypoint-initdb.d/init.sql
docker exec -it postgres_db psql -U user -c "CREATE DATABASE world;"
docker exec -it postgres_db psql -U user -d world -f /docker-entrypoint-initdb.d/init.sql
docker exec -it postgres_db psql -U user -d world
docker exec -it postgres_db psql -U user -c "CREATE DATABASE world;"
docker exec -it postgres_db psql -U user -d world
docker exec -it postgres_db psql -U postgres -c "\du"
docker-compose down -v
docker-compose up -d
docker exec -it postgres_db psql -U postgres -c "\du"
docker logs postgres_db
docker exec -it postgres_db psql -U postgres -c "\du"
docker exec -it postgres_db psql -U user -c "\du"
docker exec -it postgres_db psql -U user -c "CREATE ROLE postgres WITH SUPERUSER LOGIN PASSWORD 'password';"
docker exec -it postgres_db psql -U user -c "\l"
docker-compose down -v
docker volume rm postgres_data
docker-compose up -d
docker ps
docker exec -it postgres_db psql -U user -c "\l"
docker exec -it postgres_db psql -U user -c "CREATE DATABASE world OWNER user;"
docker-compose down -v  # Elimina contenedores y volúmenes
docker volume rm postgres_data  # Asegura que se eliminen los datos previos
docker-compose up -d  # Vuelve a crear todo desde cero
docker exec -it postgres_db psql -U user -c "\l"
docker-compose down
docker-compose down -v
docker volume rm mysql_data
docker-compose up -d
docker ps
docker exec -it mysql_db mysql -u root -prootpassword
docker-compose restart
docker exec -it mysql_db mysql -u root -prootpassword
docker-compose down
docker-compose down -v
docker-compose up -d
ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
docker stop postgres_db
docker rm postgres_db
docker-compose down -v --remove-orphans
docker-compose up -d
docker exec -it mysql_db mysql -u root -prootpassword
docker ps
docker exec -it mysql_db mysql -u root -p
docker-compose down -v --remove-orphans
docker-compose up -d
docker exec -it mysql_db mysql -u root -p
docker ps
docker exec -it mysql_db mysql -u user -p
docker-compose down
docker exec -it mysql_db mysql -u user -p
docker-compose up -d
docker exec -it mysql_db mysql -u user -p
password
docker exec -it mysql_db mysql -u user -p
docker-compose up -d
docker exec -it mysql_db mysql -u user -p
palmallanos
docker logs mysql_db
docker-compose down -v --remove-orphans
docker volume prune -f
docker-compose up -d
docker ps
docker exec -it mysql_db mysql -u root -p
docker ps -aq | xargs docker stop
docker ps -aq | xargs docker rm
docker volume prune -f
docker volume ls -q | xargs docker volume rm
docker ps
cd ucc-gestionBS/
code .
cd ucc-gestionBS/
code .
docker-compose up -d
docker ps
git add .
git commit -m "Inicialización del proyecto PostgreSQL con Docker y DBeaver"
git branch -M main
git push -u origin main
docker compose down
cd ucc-gestionBS/
code .
docker-compose up -d
git add .
git init
git add .
git commit -m "Proyecto aeropuerto check-in con Docker y PostgreSQL"
git branch -M main
git push -u origin main
git remote add origin https://github.com/erickcolin2005/aeropuerto-checkin.git
git branch -M main
git push -u origin main
git branch -M main
git push -u origin main
docker-compose down
mkdir aeropuerto_checkin
cd aeropuerto_checkin
code .
