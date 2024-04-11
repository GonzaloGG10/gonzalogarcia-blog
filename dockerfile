#FROM hugomods/hugo
#WORKDIR /app
#COPY . .
#CMD ["hugo", "server","--bind=0.0.0.0"]

# Etapa de construcción
FROM hugomods/hugo as builder
WORKDIR /app
COPY . .
CMD ["hugo", "server","--bind=0.0.0.0", "--baseUrl=http://localhost:8080/"]

# Etapa de producción
FROM nginx:stable
COPY --from=builder /app/public /usr/share/nginx/html
COPY --from=builder /app/themes /usr/share/nginx/html/themes