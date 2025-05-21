#!/usr/bin/env python3
import os
import psycopg2
from psycopg2.extras import RealDictCursor
import asyncio
import subprocess
import glob
from simulador_core import ejecutar_simulador

DSN = os.getenv("DATABASE_URL")

def conectar():
    conn = psycopg2.connect(DSN, cursor_factory=RealDictCursor)
    user = os.getenv("CLI_USER")
    if user:
        with conn.cursor() as cur:
            cur.execute('SET "app.user" = %s;', (user,))
    return conn

def obtener_rol(conn, nombre):
    with conn.cursor() as cur:
        cur.execute("SELECT rol FROM turismo.usuarios WHERE nombre = %s;", (nombre,))
        row = cur.fetchone()
    return row['rol'] if row else None

def listar_todas(conn):
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM turismo.reservas ORDER BY fecha_reserva DESC;")
        filas = cur.fetchall()
    for r in filas:
        print(f"{r['id']:3} | {r['cliente'][:12]:12} | {r['destino'][:10]:10} | {r['estado']:9} | {r['fecha_reserva']}")

def listar_mis(conn):
    user = os.getenv("CLI_USER")
    with conn.cursor() as cur:
        cur.execute("""
            SELECT * FROM turismo.reservas
            WHERE cliente = %s
            ORDER BY fecha_reserva DESC;
        """, (user,))
        filas = cur.fetchall()
    if not filas:
        print("→ No tienes reservas registradas.")
    else:
        for r in filas:
            print(f"{r['id']:3} | {r['destino'][:10]:10} | {r['estado']:9} | {r['fecha_reserva']}")

def listar_por_cliente(conn):
    cliente = input("Nombre del cliente: ").strip()
    with conn.cursor() as cur:
        cur.execute("""
            SELECT * FROM turismo.reservas
            WHERE cliente ILIKE %s
            ORDER BY fecha_reserva DESC;
        """, (f"%{cliente}%",))
        filas = cur.fetchall()
    if not filas:
        print("→ No se encontraron reservas.")
    else:
        for r in filas:
            print(f"{r['id']:3} | {r['cliente'][:12]:12} | {r['destino'][:10]:10} | {r['estado']:9} | {r['fecha_reserva']}")

def cancelar_reserva(conn):
    idr = input("ID de reserva a cancelar: ").strip()
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE turismo.reservas
            SET estado = 'CANCELADA'
            WHERE id = %s
              AND estado != 'CANCELADA'
              AND (
                    cliente = current_setting('app.user')
                    OR current_setting('app.user') = 'admin'
                  )
            RETURNING *;
        """, (idr,))
        cambio = cur.fetchone()
        conn.commit()
    if cambio:
        print(f"→ Reserva {idr} cancelada.")
    else:
        print("→ No fue posible cancelar esa reserva.")

def resumen_marketing(conn):
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM turismo.resumen_reservas_mensual;")
        filas = cur.fetchall()
    if not filas:
        print("→ No hay datos en el resumen mensual.")
    else:
        print("\n📊 Reservas últimos 6 meses\n")
        print(f"{'Mes':10} | {'Destino':10} | {'Total'}")
        print("-" * 35)
        for r in filas:
            print(f"{str(r['mes'])[:10]:10} | {r['destino'][:10]:10} | {r['total_reservas']}")

def ejecutar_simulador_desde_cli():
    try:
        n = int(input("¿Cuántas reservas deseas generar?: ").strip())
    except ValueError:
        print("⚠ Valor no válido.")
        return
    print(f"🚀 Generando {n} reservas...")
    asyncio.run(ejecutar_simulador(n))
    print("✅ Simulación finalizada.")

def generar_backup_manual():
    """Ejecuta backup.sh y verifica el contenido del dump."""
    print("→ Iniciando backup...")
    resultado = subprocess.run(["/app/backup.sh"], capture_output=True, text=True)
    if resultado.returncode != 0:
        print("❌ Error en backup:", resultado.stderr)
        return
    print(resultado.stdout)

    backups = sorted(glob.glob("/backups/reservas_*.sql.gz"))
    if not backups:
        print("⚠️ No se encontró ningún archivo de backup.")
        return

    ultimo = backups[-1]
    # Contar líneas COPY en lugar de INSERT
    cmd = f"gzip -dc {ultimo} | grep -c \"^COPY turismo.reservas\""
    cuenta = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if cuenta.returncode == 0:
        try:
            n = int(cuenta.stdout.strip())
            print(f"ℹ️  El backup '{os.path.basename(ultimo)}' contiene {n} registros de reserva (COPY).")
        except ValueError:
            print("⚠️  No se pudo leer el conteo de reservas.")
    else:
        print("⚠️  Error al comprobar el contenido del backup.")

def menu():
    cliente = input("🔐 Usuario: ").strip()
    os.environ["CLI_USER"] = cliente
    conn = conectar()
    rol = obtener_rol(conn, cliente)
    if not rol:
        print("⚠ Usuario no registrado.")
        return

    print("🧾 Sesión como:", cliente)

    if rol == "admin":
        actions = {
            "1": ("Listar todas reservas", listar_todas),
            "2": ("Buscar por cliente", listar_por_cliente),
            "3": ("Cancelar reserva", cancelar_reserva),
            "4": ("Resumen mensual", resumen_marketing),
            "5": ("Simulador", lambda c: ejecutar_simulador_desde_cli()),
            "6": ("Backup manual", lambda c: generar_backup_manual()),
            "0": ("Salir", None)
        }
    elif rol == "analista":
        actions = {
            "1": ("Resumen mensual", resumen_marketing),
            "0": ("Salir", None)
        }
    else:
        actions = {
            "1": ("Ver mis reservas", listar_mis),
            "2": ("Cancelar mi reserva", cancelar_reserva),
            "0": ("Salir", None)
        }

    while True:
        print("\n==== Menú ====")
        for k, (desc, _) in actions.items():
            print(f" {k}. {desc}")
        opt = input("> Opción: ").strip()
        if opt == "0":
            break
        func = actions.get(opt)
        if func:
            func[1](conn)
        else:
            print("Opción inválida.")

    conn.close()
    print("🔚 Adiós.")

if __name__ == "__main__":
    menu()
