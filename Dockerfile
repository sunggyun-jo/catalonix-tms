FROM python:3.10-slim as base

RUN apt-get update && \
apt-get --yes install build-essential python3-dev postgresql postgresql-client libmemcached-dev libpq-dev libldap2-dev libsasl2-dev libzbar-dev ldap-utils tox lcov valgrind && \
apt-get clean

FROM base as builder
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.10-slim AS deployer
RUN apt-get update && apt-get --yes install libpq-dev && apt-get clean
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY ./odoo-bin /app/.
COPY ./addons /app/addons
COPY ./odoo /app/odoo

WORKDIR /app

EXPOSE 8069
ENTRYPOINT ["./odoo-bin"]
CMD ["--version"]