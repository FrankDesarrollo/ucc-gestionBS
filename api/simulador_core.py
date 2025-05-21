import asyncio
import asyncpg
import os
import random
from datetime import datetime

DESTINOS = ['Cancún', 'París', 'New York', 'Roma', 'Barcelona']
CLIENTES = ['Juan Pérez', 'Ana García', 'Carlos López', 'María Fernández']

DSN = os.getenv("DATABASE_URL").replace("postgres://", "postgresql://")

async def generar_reserva(pool):
    cliente = random.choice(CLIENTES)
    destino = random.choice(DESTINOS)
    async with pool.acquire() as conn:
        await conn.execute(
            "INSERT INTO turismo.reservas (cliente, destino) VALUES ($1, $2)",
            cliente, destino
        )
    print(f"[{datetime.now().isoformat()}] → {cliente} → {destino}")

async def ciclo_simulacion(pool, n=10):
    for _ in range(n):
        await generar_reserva(pool)
        await asyncio.sleep(random.uniform(1, 2))

async def ejecutar_simulador(n=10):
    pool = await asyncpg.create_pool(dsn=DSN)
    try:
        await ciclo_simulacion(pool, n)
    finally:
        await pool.close()
