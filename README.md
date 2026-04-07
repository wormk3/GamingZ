# GamingZ · Ataxx Touch Web

Página web para ejecutar **Ataxx (arcade)** desde `ataxx.zip` usando **EmulatorJS** y una capa táctil transparente sobre el juego.

## Ejecutar localmente

Desde la raíz del repo:

```bash
python3 -m http.server 8080
```

Abrir en navegador:

- `http://localhost:8080/`

> Nota: el juego carga `ataxx.zip` desde el mismo directorio.

## Controles touch (sin palanca ni botón visible)

- **Tap o drag sobre la pantalla**: mueve un puntero touch superpuesto.
- **Al soltar el dedo**: envía `Botón 1` (`Ctrl`) para seleccionar/confirmar.
- El movimiento del puntero touch se traduce automáticamente a direcciones (`ArrowUp/Down/Left/Right`) para compatibilidad con el control tipo palanca del arcade.

## Subir cambios a GitHub automáticamente

Se agregó un hook `post-commit` para empujar automáticamente cada commit a tu rama actual en `origin`.

1. Activa el hooks path una sola vez:

```bash
./scripts/setup-auto-push.sh
```

2. Verifica que tengas remoto y permisos:

```bash
git remote -v
git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
```

A partir de ahí, cada `git commit` intentará ejecutar:

```bash
git push origin <rama-actual>
```

> Si no existe remoto `origin` o estás en `detached HEAD`, el hook se salta sin romper el commit.
