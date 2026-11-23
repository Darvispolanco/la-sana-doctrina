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

El flujo `.github/workflows/android.yml` instala Flutter y Java 17, genera el proyecto Android si todavía no existe en el repositorio, configura el identificador de AdMob, ejecuta análisis y pruebas, compila un APK de depuración y lo publica como artefacto de GitHub Actions.

El APK de depuración es para pruebas. **No es una versión firmada lista para Google Play.**

## Publicación en Google Play

Antes de publicar se debe completar la revisión editorial y doctrinal, probar la aplicación en dispositivos Android reales, definir la firma de lanzamiento, generar un Android App Bundle firmado, revisar la política de privacidad y completar la ficha de Play Console y la declaración de anuncios.

El identificador Android configurado por el flujo es `com.lasanadoctrina.app`.

## Estado

El proyecto continúa en desarrollo. La rama de trabajo y las comprobaciones más recientes se encuentran en el pull request:

https://github.com/Darvispolanco/la-sana-doctrina/pull/117
