#!/bin/bash
set -e

TIMESTAMP=$(date +"%F_%H%M")
FILE="/backups/reservas_${TIMESTAMP}.sql.gz"

echo "📦 Generando respaldo en: $FILE"
pg_dump -h "${PGHOST:-db}" -U "$PGUSER" -d "$PGDATABASE" | gzip > "$FILE"

echo "✅ Backup completado."
