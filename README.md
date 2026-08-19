# newman-tests

Imagen Docker de [Newman](https://github.com/postmanlabs/newman) (runner de colecciones Postman) con el reporter [htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra), construida y publicada automáticamente en [Docker Hub](https://hub.docker.com/r/c05m4r/newman).

## Qué hace

- Construye una imagen con Newman + htmlextra sobre base oven/bun:alpine.
- Cada día (06:00 UTC) y manualmente vía Actions, verifica si hay versiones nuevas en el registro npm.
- Ejecuta un smoke test: corre una colección contra JSONPlaceholder y valida que el reporte htmlextra se genere.
- Solo si el smoke test pasa, publica la imagen en Docker Hub.

### Tags publicados

- `c05m4r/newman:latest` — siempre la última build validada
- `c05m4r/newman:newman-X.Y.Z-htmlextra-A.B.C` — combo inmutable de versiones

## Uso

```bash
# Correr una colección
docker run --rm -v "$PWD:/tests" c05m4r/newman run /tests/mi-coleccion.json

# Con reporte htmlextra
docker run --rm -v "$PWD:/tests" c05m4r/newman run /tests/mi-coleccion.json \
  -r htmlextra --reporter-htmlextra-export /tests/reporte.html
```

## Secretos requeridos

GitHub → Settings → Secrets and variables → Actions → Environment `hubdocker`:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN` (generado en Docker Hub → Account Settings → Personal Access Tokens, permiso Read/Write)
