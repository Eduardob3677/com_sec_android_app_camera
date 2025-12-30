# Modificaciones al APK de Samsung Camera

## Resumen
Este documento describe las modificaciones realizadas al código smali de la aplicación Samsung Camera para mostrar menús y características ocultas.

## Cambios Realizados

### 1. Menú de Características (Features Menu)

**Archivo modificado:** `smali_classes4/com/sec/android/app/camera/setting/PreferenceSettingFragment.smali`

**Líneas:** 4799-4808

**Descripción:** El menú de "Features" (Características) estaba siendo eliminado por código en el método `updatePreferencesAttr()`. Se comentaron las líneas que eliminaban este menú.

**Cambio específico:**
```smali
# ANTES:
:cond_8
const v0, 0x7f1302d1
invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
move-result-object v0
invoke-direct {p0, v0}, Lcom/sec/android/app/camera/setting/PreferenceSettingFragment;->removePreference(Ljava/lang/CharSequence;)V
return-void

# DESPUÉS:
:cond_8
# Modified: Commented out to show Features menu
# const v0, 0x7f1302d1
# invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
# move-result-object v0
# invoke-direct {p0, v0}, Lcom/sec/android/app/camera/setting/PreferenceSettingFragment;->removePreference(Ljava/lang/CharSequence;)V
return-void
```

**Resultado:** Ahora el menú "Features" aparecerá en la configuración de la cámara, permitiendo acceso a:
- `FeaturesSettingActivity` - Actividad que muestra características de depuración
- `MapFeatureFragment` - Fragmento que muestra características mapeadas desde SharedPreferences

## Características Disponibles

### Menú Features
El menú Features proporciona acceso a opciones de depuración y características experimentales que normalmente solo están disponibles en builds de desarrollo.

**Ubicación en la app:**
Configuración → Features

**Funcionalidades:**
- Visualización de características booleanas y de texto
- Búsqueda de características
- Reset de características a valores predeterminados

### Otros Menús Relacionados

**Log Video Settings:**
- Ubicación: Configuración → Videos → Advanced Recording Options
- Controlado por: SharedPreferences key `pref_key_log_video_setting_menu_shown`
- Actividad: `LogVideoActivity`

**Debug Feature Menu:**
- Menú definido en: `res/menu/debug_feature_menu.xml`
- Permite resetear características de depuración

## Notas Técnicas

1. Las características de depuración se almacenan en SharedPreferences con el nombre `pref_debug_features`
2. El check original verificaba si el build era de tipo "user" o "developer"
3. Al comentar la eliminación del menú, se mantiene visible independientemente del tipo de build

## Impacto

- **Compatibilidad:** No afecta la funcionalidad normal de la cámara
- **Seguridad:** Las características expuestas son para desarrollo/depuración
- **Reversibilidad:** Los cambios pueden revertirse eliminando los comentarios

## Referencias

- `PreferenceSettingFragment.smali` - Fragmento principal de configuración
- `FeaturesSettingActivity.smali` - Actividad de características
- `FeaturesSettingFragment.smali` - Fragmento de características
- `MapFeatureFragment.smali` - Fragmento de características mapeadas
- `res/xml/setting.xml` - Archivo XML de preferencias
- `res/menu/features_setting_menus.xml` - Menú de características
