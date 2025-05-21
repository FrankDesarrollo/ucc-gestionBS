import asyncio
import os
from simulador_core import ejecutar_simulador

N = int(os.getenv("RESERVAS_GENERAR", 10))

if __name__ == "__main__":
    asyncio.run(ejecutar_simulador(N))
