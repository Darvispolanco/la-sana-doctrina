# La Sana Doctrina

Aplicación Flutter para estudiar la doctrina bíblica.

## Estado
Versión inicial de interfaz (0.1.0). Los módulos de base de datos, buscador bíblico, audio, favoritos persistentes, evaluaciones completas y AdMob todavía deben implementarse y probarse.

## Identificador previsto
`com.lasanadoctrina.app`

## Compilación local
Con Flutter y Android SDK instalados:

```bash
flutter pub get
flutter run
flutter build apk --debug
flutter build appbundle
```

## Compilación desde GitHub Actions
El workflow de `.github/workflows/android-build.yml` genera un APK de prueba al ejecutarse manualmente o al subir cambios a `main`.

## Nota
No contiene todavía una traducción bíblica integrada. Antes de incorporar un texto bíblico completo se debe verificar su licencia y permisos de distribución.
