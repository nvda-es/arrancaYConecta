# Código fuente de los clientes de TeamTalk "Arranca y conecta"

## Introducción

Este repositorio contiene el código fuente y las instrucciones necesarias para compilar los clientes de TeamTalk "Arranca y conecta" para Windows, utilizados por primera vez en el tercer encuentro de usuarios y desarrolladores de la comunidad de NVDA en español. El código se libera bajo la licencia GNU General Public License, versión 2. Eres libre de crear y distribuir copias modificadas del contenido de este repositorio y sus resultados en forma de binarios compilados, siempre que pongas a disposición de los usuarios el código fuente, menciones de dónde procede y cumplas con los términos de esta licencia.

Los clientes "Arranca y conecta" son copias portables de TeamTalk que incluyen una configuración personalizada, se ejecutan en una carpeta temporal y eliminan todo rastro de su existencia al cerrarse. Son muy útiles para aquellos usuarios que no están familiarizados con el programa original, o que tienen miedo de utilizarlo a causa de su gran complejidad.

## Requisitos

Para compilar los clientes "Arranca y conecta", necesitas disponer de lo siguiente:

* Windows 7 o posterior de 64 bits. Es necesario un sistema de 64 bits para obtener los archivos del cliente compatibles con esta arquitectura.
* TeamTalk para Windows, versión 5.8.1 o posterior. Es muy importante que instales el cliente clásico. Puedes obtener el instalador desde su [página de descargas](https://bearware.dk/?page_id=353).
* TeamTalk de 32 bits, edición portable, versión 5.8.1 o posterior. Disponible también en la página de descargas anterior.
* NSIS, versión 3.06.1 o posterior. Puedes obtenerlo desde su [página oficial](https://nsis.sourceforge.io/Main_Page).

## Instrucciones de compilación

Nota: en este repositorio se incluyen los archivos xml con nuestra configuración personalizada. Si lo deseas, elimínalos antes de seguir las siguientes instrucciones.

1. Extrae el cliente portable en la carpeta `portable32`, de tal manera que el archivo `TeamTalk5Classic.exe` se encuentre junto a todos los demás justo al entrar en dicha carpeta.
2. Navega a la carpeta TeamTalk5 dentro de Archivos de programa. Copia todo su contenido dentro de la carpeta `portable64`.
3. (opcional) Repite los pasos 2 y 3 en las carpetas para ponentes.
4. Entra en la carpeta `portable32` y ejecuta el archivo `TeamTalk5Classic.exe`.
5. Configura el cliente a tu gusto, conectándolo a un servidor por defecto si es necesario, y ciérralo al terminar. Más abajo te explicamos qué personalizaciones hemos aplicado en los nuestros.
6. Copia el archivo `TeamTalk5Classic.xml` a la carpeta `portable64`. Reemplaza si es necesario.
7. (opcional) Repite los pasos 4, 5 y 6 con los clientes para ponentes si necesitan una configuración distinta.
8. (opcional, muy recomendado) Elimina los archivos innecesarios. Más abajo explicamos qué archivos se consideran innecesarios y por qué.
9. Compila el script `Teamtalk.nsi` utilizando la opción `Compile NSIS script` que encontrarás en el menú de contexto. Si el cliente para ponentes es distinto, compila el script `Teamtalk_ponentes.nsi` también.

Al finalizar estas instrucciones, obtendrás un archivo ejecutable que funciona tanto en 32 como en 64 bits, aprovechando lo mejor de cada arquitectura.

## Opciones específicas para los clientes de la comunidad de NVDA en español

A continuación, enumeramos las opciones aplicadas en nuestros propios clientes.

### Cliente estándar

* Nivel de activación por voz: 0%.
* Transmisión por voz activada, push to talk desactivado.
* Idioma: español.
* Nickname por defecto: oyente.
* Género: neutro.
* Reducción de ruido: desactivada.
* Cancelación de eco: desactivada.
* Motor de sonido: Windows Audio Session.
* Conectar automáticamente al último servidor: activado.
* Último servidor: teamtalk.nvda.es, puertos 10333, canal "/sala de conferencias".
* El servidor también se encuentra agregado en el gestor de servidores (host manager).

### Cliente para ponentes

Todas las opciones anteriores, y además:

* Nickname por defecto: ponente.
* Eventos de sonido desactivados.
* Eventos de texto a voz desactivados.
* Panel de chat oculto (pulsar f10 desde la ventana principal para ocultarlo).

El propósito principal de estos 4 ajustes es eliminar tantas distracciones como sea posible.

## Archivos innecesarios

Los siguientes archivos se consideran innecesarios, y pueden eliminarse antes de compilar los scripts para reducir ligeramente el tamaño del resultado final:

* Carpeta `languages`
* Archivos `teamTalk5.exe` y `teamTalk5.ini.default`
* `TeamTalk5Classic.xml.default`.
* Archivos `unins000.dat` y `unins000.exe`.
* (sólo si existen) Archivos `tt5svc*` y `tt5srv*`. Aquí se incluyen los .exe, .bat y .xml.
* (Sólo en el cliente para ponentes): carpeta `sounds`.
* (Sólo en los clientes de la comunidad de NVDA en español): todos los archivos de la carpeta `lng_classic`, excepto `english.lng` y `spanish.lng`.

## Desventajas de los clientes "Arranca y conecta"

Cada vez que el cliente se cierra, todas las opciones se pierden. Por este motivo, los usuarios siempre deben hacer dos cosas justo después de abrirlo:

* Pulsar f5 y cambiar su nickname.
* Pulsar f4, navegar a la pestaña "Sistema de sonido" y seleccionar sus dispositivos (si son diferentes de los que el programa elige por defecto).
