# Use uma imagem base Python
FROM python:3.9-slim

# Define variáveis de ambiente para o Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo requirements.txt para o contêiner e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código do aplicativo para o contêiner
COPY . .

# Define o comando para executar o aplicativo usando Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
