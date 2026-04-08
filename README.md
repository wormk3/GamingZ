# GamingZ · Ataxx Touch Web

Página web para ejecutar **Ataxx (arcade)** desde `ataxx.zip` usando **EmulatorJS** y una capa táctil transparente sobre el juego. Incluye selector de core (`arcade`/`mame2003`) para compatibilidad; por defecto arranca en `mame2003` para mejorar la lectura de `ataxx.zip`.

## Ejecutar localmente

Desde la raíz del repo:

```bash
python3 -m http.server 8080
```

Abrir en navegador:

- `http://localhost:8080/`

> Nota: el juego carga `ataxx.zip` desde el mismo directorio.


## Nota importante de ROMSET

Si aparece `Romset is unknown`, el archivo `ataxx.zip` no coincide con el set esperado por el core activo.
Prueba con el selector de core en pantalla: `arcade (FBNeo)` o `mame2003`.
Si uno falla, cambia al otro y recarga. Para `mame2003` se espera romset compatible con MAME 0.78.

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

## Resolver conflictos en Pull Request (GitHub)

Si GitHub marca conflictos en `README.md` o `index.html`, haz esto en tu máquina:

```bash
git fetch origin
git checkout <tu-rama-del-pr>
git merge origin/main
# resuelve conflictos
git add README.md index.html
git commit -m "Resuelve conflictos con main"
git push origin <tu-rama-del-pr>
```

Si prefieres rebase:

```bash
git fetch origin
git checkout <tu-rama-del-pr>
git rebase origin/main
# resuelve conflictos
git add README.md index.html
git rebase --continue
git push --force-with-lease origin <tu-rama-del-pr>
```
