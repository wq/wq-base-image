FROM python:3.11-bookworm

# Install base dependencies
RUN apt-get update && apt-get install -y libgdal32 libsqlite3-mod-spatialite
RUN python -m pip install wq gunicorn whitenoise

# Install SSH server (for e.g. Azure)
RUN apt-get install -y openssh-server && echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/

# Install node and npm
RUN \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs

# Generate demo project
RUN wq create demo /demo -d localhost -t Demo --with-gis --without-npm
WORKDIR /demo/db
RUN sed -i s/prod/dev/ demo/wsgi.py
RUN sed -i '/SecurityMiddleware/a "whitenoise.middleware.WhiteNoiseMiddleware",' demo/settings/base.py
RUN <<EOF >> demo/settings/dev.py
STORAGES = {
    "staticfiles": {
        "BACKEND": "whitenoise.storage.CompressedStaticFilesStorage",
    },
}
EOF
RUN python manage.py deploy 0.0.0

# Initialize database with test user
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput --username=testadmin --email=test@example.com
RUN python manage.py shell <<EOF
from django.contrib.auth.models import User
user = User.objects.get(username="testadmin")
user.set_password("testadmin")
user.save()
EOF

# Run server
ENV PYTHONUNBUFFERED 1
EXPOSE 8080
CMD ["gunicorn", "demo.wsgi", "-b", ":8080", "--workers", "2", "--access-logfile", "-"]
