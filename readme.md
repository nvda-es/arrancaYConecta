# Código fuente de los clientes de TeamTalk "Arranca y conecta"

## Introducción

Este repositorio contiene el código fuente y las instrucciones necesarias para compilar los clientes de TeamTalk "Arranca y conecta" para Windows, utilizados por primera vez en el tercer encuentro de usuarios y desarrolladores de la comunidad de NVDA en español. El código se libera bajo la licencia GNU General Public License, versión 2. Eres libre de crear y distribuir copias modificadas del contenido de este repositorio y sus resultados en forma de binarios compilados, siempre que pongas a disposición de los usuarios el código fuente, menciones de dónde procede y cumplas con los términos de esta licencia.

Los clientes "Arranca y conecta" son copias portables de TeamTalk que incluyen una configuración personalizada, se ejecutan en una carpeta temporal y eliminan todo rastro de su existencia al cerrarse. Son muy útiles para aquellos usuarios que no están familiarizados con el programa original, o que tienen miedo de utilizarlo a causa de su gran complejidad.

## Requisitos

Para compilar los clientes "Arranca y conecta", necesitas disponer de lo siguiente:

* Windows 7 o posterior de 64 bits. Es necesario un sistema de 64 bits para obtener los archivos del cliente compatibles con esta arquitectura.
* TeamTalk para Windows, versión 5.6.3 o posterior. Es muy importante que instales el cliente clásico. Puedes obtener el instalador desde su [página de descargas](https://bearware.dk/?page_id=353).
* TeamTalk clásico de 32 bits, edición portable, versión 5.6.3 o posterior. Es fácil llegar a él modificando ligeramente la URL de descarga del instalador. Por ejemplo, la versión 5.6.3 se puede descargar desde [aquí](http://bearware.dk/teamtalk/v5.6.3/TeamTalkClassic_v5.6.3_Portable.zip).
* NSIS, versión 3.06.1 o posterior. Puedes obtenerlo desde su [página oficial](https://nsis.sourceforge.io/Main_Page).

## Instrucciones de compilación

1. Dentro de este repositorio, crea dos carpetas llamadas `portable32` y `portable64`. Si quieres compilar el cliente específico para ponentes, crea otras dos carpetas, llamadas `portable32_ponentes` y `portable64_ponentes`.
2. Extrae el cliente portable en la carpeta `portable32`, de tal manera que el archivo `TeamTalk5Classic.exe` se encuentre junto a todos los demás justo al entrar en dicha carpeta.
3. Navega a la carpeta TeamTalk5 dentro de Archivos de programa. Copia todo su contenido dentro de la carpeta `portable64`.
4. (opcional) Repite los pasos 2 y 3 en las carpetas para ponentes.
5. Entra en la carpeta `portable32` y ejecuta el archivo `TeamTalk5Classic.exe`.
6. Configura el cliente a tu gusto, conectándolo a un servidor por defecto si es necesario, y ciérralo al terminar. Más abajo te explicamos qué personalizaciones hemos aplicado en los nuestros.
7. Copia el archivo `TeamTalk5Classic.xml` a la carpeta `portable64`. Reemplaza si es necesario.
8. (opcional) Repite los pasos 5, 6 y 7 con los clientes para ponentes si necesitan una configuración distinta.
9. (opcional, muy recomendado) Elimina los archivos innecesarios. Más abajo explicamos qué archivos se consideran innecesarios y por qué.
10. Compila el script `Teamtalk.nsi` utilizando la opción `Compile NSIS script` que encontrarás en el menú de contexto. Si el cliente para ponentes es distinto, compila el script `Teamtalk_ponentes.nsi` también.

Al finalizar estas instrucciones, obtendrás un archivo ejecutable que funciona tanto en 32 como en 64 bits, aprovechando lo mejor de cada arquitectura.

## Opciones específicas para los clientes de la comunidad de NVDA en español

A continuación, enumeramos las opciones aplicadas en nuestros propios clientes.

### Cliente estándar

* Nivel de activación por voz: 0%.
* Transmisión por voz activada, push to talk desactivado.
* Idioma: español.
* Nickname por defecto: oyente.
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

* Carpeta `JAWS script`.
* Carpeta `NVDA plugin`.
* Carpeta `Window eyes plugin`.
* `TeamTalk5Classic.xml.default`.
* Archivos `unins000.dat` y `unins000.exe`.
* (sólo si existen) Archivos `tt5svc*` y `tt5srv*`. Aquí se incluyen los .exe, .bat y .xml.
* (Sólo en el cliente para ponentes): carpeta `sounds`.
* (Sólo en los clientes de la comunidad de NVDA en español): todos los archivos de la carpeta `lng_classic`, excepto `english.lng` y `spanish.lng`.

## Desventajas de los clientes "Arranca y conecta"

Cada vez que el cliente se cierra, todas las opciones se pierden. Por este motivo, los usuarios siempre deben hacer dos cosas justo después de abrirlo:

* Pulsar f5 y cambiar su nickname.
* Pulsar f4, navegar a la pestaña "Sistema de sonido" y seleccionar sus dispositivos (si son diferentes de los que el programa elige por defecto).
