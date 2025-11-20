import sqlite3

# Lê o script SQL com a criação das tabelas e inserts
with open("create_database.sql", "r", encoding="utf-8") as f:
    sql_script = f.read()

# Cria (ou abre) o arquivo de banco de dados SQLite
conn = sqlite3.connect("database.db")
cursor = conn.cursor()

# Executa todo o script de criação
cursor.executescript(sql_script)

# Salva e fecha
conn.commit()
conn.close()

print("Banco de dados criado com sucesso!")
