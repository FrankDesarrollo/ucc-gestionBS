# PROYECTO 3 (TURISMO)

Repositorio del proyecto **Sistema de Reservas Turísticas Contenerizado** desarrollado en la Universidad XYZ.

## Descripción

Este sistema implementa una plataforma de gestión de reservas de tours turísticos 100% contenerizada con **Docker** y orquestada con **Docker Compose**. Incluye:

* Servicio de base de datos PostgreSQL con:

  * Esquemas y tablas (`reservas`, `usuarios`, `auditoria`).
  * Row-Level Security (RLS) para asegurar que cada cliente solo acceda a sus propias reservas.
  * Triggers de auditoría que registran cada operación en formato JSONB.
* CLI en Python (`cli.py`) que permite:

  * Autenticación de usuarios y establecimiento de roles.
  * Listado, búsqueda y cancelación de reservas. 
  * Visualización de informe mensual (últimos 6 meses) mediante vista agregada.
  * Ejecución de respaldos manuales (`backup.sh`) con verificación de registros respaldados.
  * Generación bajo demanda de datos de prueba mediante simulador asíncrono.
* Módulo de simulación (`simulador_core.py`) que inserta reservas simuladas usando `asyncio`.
* Contenedor de backup que utiliza `pg_dump` y `gzip` para crear dumps comprimidos.

## Estructura del repositorio

```
/ucc-gestionBS
│
├─ api/                      # Código fuente de la API y CLI
│  ├─ backups/               # Carpeta de archivos dump *.sql.gz
│  ├─ docker-entrypoint-initdb.d/
│  │    └─ init.sql          # Script de inicialización de la base
│  ├─ backup.sh              # Script de generación de respaldos
│  ├─ cli.py                 # Interfaz de línea de comandos
│  ├─ Dockerfile             # Imagen base para CLI y simulador
│  ├─ requirements.txt       # Dependencias Python
│  ├─ simulador_core.py      # Lógica de simulación async
│  └─ simulador.py           # Script que invoca la simulación
│
└─ infra/                    # Orquestación Docker
   └─ docker-compose.yml     # Definición de servicios, redes y volúmenes
```

## Requisitos

* Docker
* Docker Compose
* Git

## Instalación y Ejecución

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/tu-usuario/ucc-gestionBS.git
   cd ucc-gestionBS/infra
   ```
2. Construir y levantar los servicios:

   ```bash
   docker compose up -d --build
   ```
3. Ejecutar el CLI:

   ```bash
   docker compose run cli
   ```
4. (Opcional) Ejecutar simulador con perfil “simulador”:

   ```bash
   docker compose --profile simulador up
   ```

## Uso del CLI

Al iniciar el CLI, se solicitará el nombre de usuario (ej. `admin`, `Juan Pérez`). Según su rol, el menú presentará opciones:

1. Listar reservas
2. Buscar reservas (admin)
3. Cancelar reserva
4. Resumen mensual
5. Simulador (admin)
6. Backup manual (admin)
7. Salir

## Historias de Usuario

* **HU1:** Respaldo semanal de la base de datos.
* **HU2:** Acceso restringido de usuarios a sus propias reservas (RLS).
* **HU3:** Informe de reservas de los últimos seis meses.
* **HU4:** Optimización de consultas con índices en `fecha_reserva` y `estado`.
* **HU5:** Diseño preparado para integración de MFA.
* **HU6:** Auditoría de todas las operaciones en `reservas`.
* **HU7:** Simulación de datos de prueba parametrizada.

## Contacto

Para dudas o sugerencias, contactar a **Equipo de Desarrollo**
