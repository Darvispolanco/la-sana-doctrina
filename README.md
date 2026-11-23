# La Sana Doctrina

Aplicación Flutter para formación bíblica y defensa de la doctrina cristiana, con énfasis en la enseñanza trinitaria: un solo Dios, Padre, Hijo y Espíritu Santo.

## Módulos disponibles en el código

- **Estudios bíblicos:** catálogo de 150 estudios, con búsqueda y lectura detallada.
- **Defensa de la doctrina:** 100 documentos Markdown cargados desde los recursos de la aplicación, con búsqueda y opción de guardar.
- **Diccionario teológico:** catálogo ampliado de 658 términos con definiciones, contexto y referencias bíblicas.
- **Evaluaciones:** 50 evaluaciones de 20 preguntas cada una. La curación editorial de las preguntas sigue en proceso; el número total no significa que todos los reactivos hayan sido revisados individualmente.
- **Guardados:** conserva localmente los identificadores de estudios y documentos de Defensa mediante `shared_preferences`.
- **Anuncios:** Google Mobile Ads está integrado, pero el banner del código usa el identificador de prueba oficial de Google. Antes de monetizar se debe sustituir por una unidad publicitaria real y verificar la configuración de AdMob.
- **Uso sin conexión:** los estudios, documentos de Defensa y diccionario están incluidos como recursos locales; los anuncios requieren conexión. No hay un buscador bíblico independiente ni una Biblia completa integrada.

No se incluye una sección de enseñanzas en audio ni una traducción bíblica completa integrada.

## Requisitos

- Flutter estable compatible con Dart 3.10 o posterior.
- Android SDK para compilar y ejecutar localmente.

## Compilación desde GitHub Actions

El flujo `.github/workflows/android.yml` instala Flutter y Java 21, genera el proyecto Android si todavía no existe en el repositorio, configura el identificador de AdMob, ejecuta análisis y pruebas y publica APK con nombres únicos, número de compilación creciente y SHA-256.

El APK de depuración es exclusivamente para pruebas y no debe usarse como actualización de una instalación de producción. El APK de producción solo se genera cuando están configurados los cuatro GitHub Actions Secrets de firma persistente: `ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS` y `ANDROID_KEY_PASSWORD`. Si faltan, el flujo publica únicamente el APK de depuración y omite el APK de producción para evitar entregar una compilación firmada con una clave temporal que no pueda actualizar la instalación anterior. Todas las versiones de producción deben usar el mismo keystore. No se debe subir el keystore ni sus contraseñas al repositorio. La publicación en Google Play requiere además un AAB firmado y la configuración correspondiente de Play App Signing.

## Publicación en Google Play

Antes de publicar se debe completar la revisión editorial y doctrinal, probar la aplicación en dispositivos Android reales, definir la firma de lanzamiento, generar un Android App Bundle firmado, revisar la política de privacidad y completar la ficha de Play Console y la declaración de anuncios.

El identificador Android configurado por el flujo es `com.lasanadoctrina.app`.

## Estado

El proyecto continúa en desarrollo. La rama de trabajo y las comprobaciones más recientes se encuentran en el pull request:

https://github.com/Darvispolanco/la-sana-doctrina/pull/117
