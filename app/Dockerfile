FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# Permissões para OpenShift (usuário aleatório)
RUN chgrp -R 0 /app && chmod -R g=u /app

EXPOSE 8080

# Produção com Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
