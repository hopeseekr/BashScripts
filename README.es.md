# Colección de Scripts de Bash de HopeSeekr

Utilidades para facilitar tu vida.

¡Scripts que uso a diario, o en nuevas instalaciones de sistemas, que mejoran sustancialmente mi experiencia con 
Linux!

![Logo de Hope](https://avatars2.githubusercontent.com/u/50506504?s=200&v=4)

Están ordenados por cuánta utilidad me brindan.

Tabla de Contenidos (Categorizada)
===============================
* **Super Productividad**
    * **[bash_profile](#bash_profile)** — `.bash_profile` y `.bashrc` de alta calidad para usuarios avanzados.
    * **[bash_rc.aliases](#bash_rcaliases)** — Alias y funciones de .bashrc de alto octanaje para una mejor calidad de 
      vida.
    * **[bash-timer](#bash-timer)** — ¡Agregue fácilmente el tiempo de ejecución legible para humanos para cada comando en bash!
    * **[ssh-autologin](#ssh-autologin)** — Configura automáticamente los autologins de SSH.
    * **[ssh-keyphrase-only-once](#ssh-keyphrase-only-onceinstaller)** — Solo solicita tu frase de contraseña de SSH una 
      vez por arranque.
    * **[gitconfig](#gitconfig)** — Configuración de Git CLI de alto octanaje.
* **Calidad de Vida de Git**
    * **[git-change-author](#git-change-author)** — Cambia fácilmente el nombre y el correo electrónico del autor en masa 
      en un repositorio git.
    * **[git-commit-at-modded-time](#git-commit-at-modded-time)** — Usa el tiempo modificado de un archivo como el tiempo 
      de git.
    * **[git-filter-copy](#git-filter-copy)** — Copia directorios de trabajo de Git, preservando el estado limpio y las modificaciones locales mientras respeta las reglas de exportación de .gitattributes.
    * **[git-mtime](#git-mtime-git-modified-time-restorer)** — Restaura el tiempo de modificación de cada archivo al del 
      historial del repositorio.
    * **[git-same-sig-time](#git-same-sig-time)** — Unifica el tiempo de la firma GPG con el tiempo del commit.
    * **[git-shallow-pull](#esotericgit-shallow-pull)** — Actualiza superficialmente un repositorio `git clone --depth 1` 
      poco profundo.
    * **[git-shift-time](#git-shift-time)** — Ajusta los timestamps de los commits de git en minutos o a una 
      fecha específica.
* **CronTabs**
    * **[cron.daily/00_clear-cache](#crondaily00_clear-cache)** — Elimina archivos de caché inútiles cada noche.
    * **[cron.daily/01_purge-locales](#crondaily01_purge-locales)** — Elimina locales internacionales sin valor.
    * **[cron.hourly/btrfs-snapshot](#cronhourlybtrfs-snapshot)** — Respalda tu BTRFS / cada hora.
    * **[cron.daily/btrfs-snapshot](#crondailybtrfs-snapshot)** — Respalda tu BTRFS / diariamente.
    * **[cron.hourly/php-clean-tmp](#cronhourlyphp-clean-tmp)** — Limpia archivos temporales de PHP en servidores ocupados.
* **Calidad de Vida**
    * **[launch-browser](#launch-browser)** — Script de utilidad para lanzar navegadores que los inicia en modo Wayland 
      completo.
    * **[ls-by-min](#ls-by-min)** — Ordena la salida de `ls` por tamaño de archivo, descendente.
    * **[my-ip](#my-ip)** — Obtén fácilmente la dirección IP pública de esta máquina.
    * **[random-file](#random-file)** — Elige aleatoriamente un archivo o directorio y lo muestra.
    * **[sync-watch](#sync-watch)** — Muestra una pequeña pantalla actualizada de cuántos MB necesitan escribirse en los 
      discos.
    * **[tar-sorted](#tar-sorted)** — Crea archivos tar automáticamente ordenados por nombre de archivo.
    * **[turn-off-monitors](#turn-off-monitors) — Apaga todos los monitores a través de la línea de comandos (CLI)**.
    * **[wifi-show-password](#wifi-show-password)** — Muestra la contraseña wifi conectada actualmente.
* **Scripts Fantásticos**
    * **[american-date](#american-date)** — Una utilidad para imprimir fechas en formato americano.
    * **[changelog-maker-lite](#changelog-maker-lite)** — Crea rápidamente un hermoso registro de cambios a partir del 
      historial de commits.
    * **[image-mp3-to-video](#image-mp3-to-video)** — Combina una imagen con un archivo mp3 para crear un video H264.
    * **[stream-to-youtube](#stream-to-youtube)** — Transmisión en vivo directamente a YouTube desde la línea de comandos.
    * **[sudoers.d/00_prompt_once](#sudoersd00_prompt_once)** — Solo solicita tu contraseña de sudo una vez por arranque.
    * **[watermark.sh](#watermarksh)** — Incrusta fácilmente tu propia marca de agua en videos.
    * **[wifi-autorun-on-connect](#wifi-autorun-on-connectinstaller)** — Ejecuta automáticamente un script al conectarte a 
      un punto de acceso Wifi.
    * **[x265.sh](#x265sh)** — Transcodifica a h265 HEVC a través de la tarjeta gráfica Intel usando VAAPI.
* **Utilidades Esotéricas**
    * **[arch-pacman-dupe-cleaner](#esotericarch-pacman-dupe-cleaner)** — Elimina entradas duplicadas de Arch Linux Pacman.
    * **[arch-upgrade-postgres](#esotericarch-upgrade-postgres)** — Automatiza la actualización de PostgreSQL de una versión a la siguiente en Arch Linux.
    * **[init-btrfs-rootfs](#esotericinit-btrfs-rootfs)** — Pone todo en subvolúmenes BTRFS organizados + activa las 
      instantáneas.
    * **[clone-github-repos.php](#esotericclone-github-reposphp)** — Descarga todos los repositorios de GitHub de un 
      usuario/organización.
* **Framework de Bash**
    * **[is_root](#is_root)** — Proporciona la función `is_root` para determinar si el usuario actual tiene acceso root.
    * **[wait_until_mouse_or_keyboard_event](#wait_until_mouse_or_keyboard_event)** — Bloquea la ejecución hasta que se 
      presiona una tecla, se mueve el mouse o se hace clic en un botón del mouse.

* [Licencia](#license) — Creative Commons v4.0 Internacional
* [Acerca del Autor](#about-the-author)

## bash_profile

Une muchos de los BashScripts para crear un sistema súper poderoso.

## bash_rc.aliases

¡Este es posiblemente la pieza más valiosa del proyecto!

Estas docenas de alias hacen que trabajar con Linux y desarrollar software de aplicaciones web sea mucho más 
eficiente y optimizado. 

¡Ve a revisar el archivo! [bash_rc.aliases](bash_rc.aliases)

## bash-timer

¡Agregue fácilmente el tiempo de ejecución legible para humanos para cada comando en bash!

El tiempo aparecerá en la parte inferior izquierda, inmediatamente a la izquierda de su $PS1.

![bash-timer image](https://user-images.githubusercontent.com/1125541/93687425-7c392100-fa83-11ea-9d36-cacbe03cc725.png)
```
2 days 05:02:11.33 # A very long process
```

**Para instalar:**

```bash
curl https://raw.githubusercontent.com/hopeseekr/bash-timer/v1.5.0/install | bash
```

[**Ver el README.md**](bash-timer/README.md) para más información.

## ssh-autologin

Configura automáticamente (si es necesario) una clave privada SSH y la instala en el servidor remoto (creando también 
el directorio .ssh, si es necesario).

## ssh-keyphrase-only-once.installer

Configura adecuadamente tu cliente OpenSSH e instala `ssh-agent` en tu `~/.bash_profile` de tal manera que solo 
tendrás que ingresar tu frase de contraseña SSH una vez por inicio de sesión para cualquier cosa que funcione con 
`ssh-agent`.

## gitconfig

Un archivo .gitconfig altamente optimizado para desarrolladores de software experimentados listos para aumentar su 
productividad diaria.

Instálalo en ~/.gitconfig.

    git pretty
    git ll

Muestra un hermoso registro multicolor con fechas estándar ISO:

![git pretty](https://user-images.githubusercontent.com/1125541/94773688-e904c300-0381-11eb-878a-d0396d2bf102.png)

    git fix

Salta rápidamente a rebasar (rebase) los últimos dos commits en uno solo.

    git alterego

Cambia rápidamente el repositorio actual para usar tu cuenta alterego principal para un commit previamente realizado.

    git ego

El inverso de git alterego.

    git resign <hash>

Vuelve a firmar rápidamente commits en bloque desde  hasta el más reciente.

Esto es particularmente útil cuando tu clave GPG expira y necesitas renovarla y luego volver a firmar.

    git c: checkout
    git cp: cherry-pick
    git cpm: cherry-pick for Merge commits

Alias utilitarios para hacer que git sea más eficiente de usar.

    git shows

Muestra la firma GPG para cada commit en git log.

## git-change-author

Cambia fácilmente el nombre y el correo electrónico del autor de cualquiera de los commits en un repositorio de git.

Uso: `git-change-author "Tu Nombre" "email@direccion" [SHA1]`

## git-commit-at-modded-time

Utiliza la hora de modificación de un archivo como la hora de git.

Ejemplo:

    $ ls -l american-date
     #-rwxrwxr-x+ 1 1MB Oct 14  2020  american-date
    $ ./git-commit-at-modded-time american-date
    $ git pretty american-date
    7462b66 G 2020-10-14 15:53:34 -0500 Theodore R. Smith

## git-filter-copy

Esta utilidad está diseñada para copiar directorios teniendo en cuenta si el directorio fuente es un repositorio Git o no. Si la fuente es un repositorio Git, exporta el estado actual del proyecto desde el directorio de trabajo, incluyendo cualquier modificación local que sea seguida por Git y que no esté marcada con ignorar-exportación en .gitattributes.

Esto significa copiar archivos que han sido confirmados (commit) en el repositorio (o modificados localmente pero aún seguidos), excluyendo archivos que nunca fueron confirmados o ignorados explícitamente vía .gitattributes. Esto asegura que obtienes solo los archivos del proyecto relevantes e intencionales para las pruebas locales.

## git-mtime Restaurador de Hora de Modificación de Git

Restaura la hora de modificación de cada archivo en tu directorio de trabajo a cuando fue actualizado por última vez 
en el repositorio remoto de git.

Cuando haces checkout de un repositorio y ejecutas esto, tu directorio de trabajo cambia de:

    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 CHANGELOG.txt
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 git-mtime

A:

    -rwxrwxr-x+ 1 tsmith users 1MB Oct  1 08:38 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct  1 01:10 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Sep 30 23:19 git-mtime

## git-same-sig-time

Unifica la hora de la firma GPG con la hora del commit.

Antes:

     gpg: Signature made Fri 19 Jan 2024 06:50:44 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     43578ec G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Fri 19 Jan 2024 06:50:25 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     8ab4104 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

Después:

     gpg: Signature made Tue 16 Jan 2024 01:52:41 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     515e36b G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Mon 15 Jan 2024 08:27:07 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     22c5040 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

## git-shift-time

Ajusta los timestamps de los commits de git en minutos o a una fecha específica, preservando las firmas GPG.

Esta utilidad te permite desplazar los tiempos de commit hacia adelante o hacia atrás por un número específico de minutos,
o configurarlos en una fecha/hora específica. Es útil para corregir timestamps de commit después de trabajar en
diferentes zonas horarias, alinear commits en momentos específicos, o corregir commits mal sincronizados.

```bash
git-shift-time <commit-hash> <desplazamiento-en-minutos> [fecha-objetivo]
```

## tar-sorted
 
Crea archivos tar automáticamente ordenados por nombre de archivo.

Esto es particularmente útil en sistemas de archivos de orden aleatorio, como ext4.

Con Bettergist Collector, usamos esto para poder estimar aproximadamente cuánto tiempo tomará comprimir y extraer 
archivos de múltiples gigabytes con millones de archivos.

Es un reemplazo directo de `tar`, y usa los mismos argumentos.

Opcionalmente, puedes instalar la función directamente en tu ~/.bashrc.

## cron.daily/00_clear-cache

- Vacía el directorio ~/.cache de cada usuario que no sea root.
- Vacía el directorio de caché de paquetes de Pacman.

Esto puede usar opcionalmente [nullfsvfs](https://github.com/abbbi/nullfsvfs) para limitar el desgaste de los SSDs.

## cron.daily/01_purge-locales

Elimina todos los archivos de locales que no sean EN todos los días.

Esto ahorra, usualmente, de 400 a 1000 MB de espacio.

## cron.hourly/btrfs-snapshot

Toma instantáneas BTRFS de / cada hora en punto.

## cron.daily/btrfs-snapshot  

Limpia las instantáneas por hora del día anterior mientras mantiene las instantáneas diarias.

## cron.hourly/php-clean-tmp

Limpia archivos temporales de PHP que de otra manera serían inútiles, lo cual es muy útil en servidores ocupados.
* Archivos de sesión antiguos que no han sido modificados en la última hora.
* Archivos temporales de phpunit.
* Archivos temporales de phpstan.

## american-date

Una utilidad para imprimir fechas en el formato americano

    Vie, 19 Enero 2024 05:49:20 CST

## changelog-maker-lite

Crea fácilmente [CHANGELOGs](CHANGELOG.md) basados en registros de commits de git concisos:

    [2020-10-01 00:23:15 CDT] — [x265.sh] Use VAAPI for encoding using Intel graphics cards.
    [2020-10-01 00:30:00 CDT] — Created a README.md.
    [2020-10-01 00:37:07 CDT] — [random-file] renamed for more clarity.
    [2020-10-01 00:44:34 CDT] — Flushed out the README.
    [2020-10-01 00:49:44 CDT] — [bash_rc.aliases] Added a whole slew of webdev aliases.
    [2020-10-01 00:58:00 CDT] — [bash_rc.aliases] Added some more descriptions.
    [2020-10-01 01:10:26 CDT] — [.gitconfig] Added a whole bunch of my git aliases. tag: v1.0.0
    [2020-10-01 08:17:42 CDT] — [clear-cache] Delete broken symlinks in the ~/.cache directories.

## launch-browser <browser-path>

1. Detecta si el usuario está ejecutando Wayland. Si es así, para los navegadores basados en Chromium, pasará las 
   banderas necesarias para que se ejecute en modo nativo de Wayland (no XWayland) para un rendimiento superior.
2. Siempre se lanzará usando el llavero de Gnome, de modo que no perderás todas tus cookies y logins permanentes cada 
   vez que cambies a KDE, y viceversa.

## ls-by-min <MB>

Devuelve una lista de archivos ordenados por tamaño de archivo, de forma descendente, que tienen al menos X MB de 
tamaño.

## my-ip

Obtén fácilmente la dirección IP pública de esta máquina.

## random-file

Elige un archivo aleatorio en un directorio / directorio de trabajo actual (PWD).

## stream-to-youtube

¡Transmisor de pantalla en vivo de YouTube directamente desde la línea de comandos (a través de ffmpeg)!

## sudoers.d/00_prompt_once

Esto hará que `sudo` solo te pida la contraseña UNA VEZ durante un solo arranque. No te pedirá a través de diferentes 
terminales y no expirará. Al reiniciar, expirará automáticamente.

## sync-watch

Muestra cuántos megabytes aún deben escribirse en discos [lentos].

    Every 5.0s: grep -e Dirty: -e Writeback: /proc/meminfo                                                    
    asus-z13: Fri Jan 19 07:09:32 2024
    
    Dirty:            751552 kB
    Writeback:             0 kB

## turn-off-monitors

Apaga fácilmente todos tus monitores a través de la línea de comandos.

Para cuando quieres alejarte y no preocuparte tanto por una pantalla de bloqueo.

## watermark.sh

Agrega una marca de agua a videos a través de ffmpeg.

## wifi-autorun-on-connect.installer

Instala un script de NetworkManager que se ejecuta automáticamente cuando se conecta a redes WiFi específicas.

## wifi-show-password

Muestra la contraseña wifi conectada actualmente.

## x265.sh

Transcodifica a x265 HEVC a través de ffmpeg utilizando la tarjeta gráfica de Intel.

# Utilidades esotéricas

## esoteric/arch-pacman-dupe-cleaner

Ayuda a reparar automágicamente entradas duplicadas en la base de datos de Pacman en Arch Linux.

Está destinado a resolver el raro problema: "error: duplicated database entry 'foo'"

## esoteric/arch-upgrade-postgres

Automatiza las instrucciones wiki de Arch Linux para actualizar PostgreSQL de una versión a la siguiente.

## esoteric/git-shallow-pull

Actualiza de forma superficial un repositorio `git clone --depth 1` poco profundo.

## esoteric/init-btrfs-rootfs

En Arch Linux, una configuración de btrfs pone cada archivo individual en /. Esto limita en gran medida la capacidad 
de administrar adecuadamente el sistema, con subvol=5 sin nada más que subvolúmenes.

Este script hace lo siguiente:

* Crea nuevas instantáneas a nivel raíz: `@rootfs` (/), `@snapshots`, `@important` y `@home`.
* Mueve los archivos de `/` a `/@rootfs`, los de `/home` a `/home` y crea nuevos directorios `/snaps` e 
  `/important`.
* Crea `/media/true-root` que se monta automáticamente en `/ (subvol=5)`.
* Se integra con los cronjobs de instantáneas automáticas `cron.d` en este proyecto
   * `/` se toma una instantánea diariamente en `/snaps/daily/YYYY-MM-DD`.
   * `/important` se toma una instantánea **cada hora** en `/snaps/important/YYYY-MM-DD/HH`.
   * `/important` está configurado para tener la compresión habilitada.
   * Configura `/home` para aplicar una cuota basada en el 10% del espacio total del disco por usuario, y el 50% del 
     espacio total del disco para cada usuario.
   * La instantánea de `/home` está configurada para tener la compresión habilitada.
   * `/home` tiene instantáneas rotativas de 7 días para los archivos `.*` de los usuarios, excepto para los 
     directorios de `caché` (cuando se usa [cron.daily/00_clear-cache]).
   
### El Problema

Arch Linux coloca todo el contenido de / en el subvolumen principal de BTRFS (ID=5).

Esto significa que las tareas comunes de creación de instantáneas y subvolúmenes, en particular, retroceder a un 
subvolumen raíz anterior (por ejemplo, funcional) es excepcionalmente difícil y requiere un arranque de rescate, etc.

### La Solución

La solución proporcionada soluciona temporalmente la situación, con suerte sin la necesidad de un disco de rescate, en 
un entorno en vivo. Sin embargo, realmente deberías tener un disco de rescate preparado de antemano.

¡Y por el amor de Dios, haz copias de seguridad primero!
![btrfs-init-rootfs](https://user-images.githubusercontent.com/1125541/94771567-231f9600-037d-11eb-8032-50d2b5873f36.png)

## esoteric/clone-github-repos.php

Descarga automáticamente todos los repositorios de GitHub de un usuario o una organización.

## Framework de Bash

### is_root

Cuando se ejecuta de forma independiente, mostrará "Running as root" (Ejecutando como root) o "Not running as root" 
(No ejecutando como root).

Cuando se llama como una función, devolverá `true` o `false`.

## wait_until_mouse_or_keyboard_event

Bloquea el programa en ejecución hasta que se presiona una tecla, se mueve el ratón o se presiona un botón del ratón, 
en cualquier lugar, independientemente del enfoque de la ventana.

Mostrará uno de los siguientes: KEYBOARD_KEY (TECLA_DE_TECLADO), MOUSE_CLICKED (RATÓN_CLIC) o MOUSE_MOVED 
(RATÓN_MOVIDO).

Se puede ejecutar de forma independiente o como una función.

# Licencia

Este proyecto está licenciado bajo la [Licencia Creative Commons Attribution v4.0 International](LICENSE.cc-by.md).
![CC.by License Summary](https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png)

# Acerca del Autor

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.
