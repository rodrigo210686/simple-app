FROM python

WORKDIR /app

COPY . /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ajuste de permissões para OpenShift
RUN chgrp -R 0 /app && chmod -R g=u /app

EXPOSE 8080

ENV FLASK_APP=app:app

CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
