FROM public.ecr.aws/docker/library/nginx:1.20

WORKDIR /var/www/html
VOLUME ["/var/www/html"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/*