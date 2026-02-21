# 🐳 Docker: HackerArchive Deployment

This project reproduces a Docker deployment exercise from a technical
assessment.

---

## 📌 Problem Statement

You are working on the deployment of the **"HackerArchive"** software.

Complete the `Dockerfile` so that it:

1. Uses the image\
   `public.ecr.aws/docker/library/nginx`\
   with tag `1.20` as the parent image.

2. Declares a volume at:

   ```Code
   /var/www/html
   ```

3. Sets `/var/www/html` as the working directory.

4. Installs the APT package:

   ```Code
   ca-certificates

   ensuring:
   - The package list is updated before installation.
   - Package lists are cleaned afterward to reduce image size.
   ```

The completed solution must work in a clean environment using only
changes made to the `Dockerfile`.

---

## 🛠️ Solution

```dockerfile
FROM public.ecr.aws/docker/library/nginx:1.20

WORKDIR /var/www/html
VOLUME ["/var/www/html"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/*
```

---

## 🚀 Build Instructions

From the project directory:

```bash
docker build -t hackerarchive:local .
```

---

## 🔍 Validation

Verify working directory:

```bash
docker image inspect hackerarchive:local --format '{{.Config.WorkingDir}}'
```

Verify declared volume:

```bash
docker image inspect hackerarchive:local --format '{{.Config.WorkingDir}}'
```

---

## 🧠 Key Concepts Demonstrated

- Correct parent image selection
- Volume declaration
- Working directory configuration
- APT package installation best practices
- Layer cleanup for smaller image size
- Debian-based container package management

---

## 📦 Tech Stack

- Docker
- Nginx 1.20
- Debian-based container image

---

## 📎 Notes

This project is intended for educational and portfolio purposes,
demonstrating Docker fundamentals and container configuration best
practices.
