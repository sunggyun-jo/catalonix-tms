# Getting Started

## Prerequisites
- Docker Desktop 
- Python 3.10

## Installation
```bash
$ git clone https://github.com/sunggyun-jo/catalonix-tms.git --depth 1 --branch main
```

```bash
$ cd catalonix-tms

$ echo -n "password" > .odoo_pg_pass # postgresql password

$ docker-compose up -d

[+] Running 2/3
 ⠸ Network catalonix-tms_default  Created       0.3s
 ✔ Container catalonix-tms-db-1   Started       0.2s
 ✔ Container catalonix-tms-web-1  Started       0.2s
```

```bash
$ curl http://localhost:8069

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<title>Redirecting...</title>
<h1>Redirecting...</h1>
<p>You should be redirected automatically to target URL: <a href="/web">/web</a>. If not click the link.
```