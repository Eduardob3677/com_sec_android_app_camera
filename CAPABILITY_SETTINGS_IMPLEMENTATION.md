# Camera Capability Settings Implementation

## Overview
This implementation adds a comprehensive settings menu to the Samsung Camera app that allows users to enable/disable 61 different camera capabilities through toggle switches. The state of each switch is saved using SharedPreferences, and CapabilityImpl reads these preferences to override device defaults.

## Architecture

### Components

1. **CameraCapabilitySettingsActivity** (`smali_classes4/com/sec/android/app/camera/setting/CameraCapabilitySettingsActivity.smali`)
   - Main settings activity that dynamically generates switches for all 61 capabilities
   - Uses SharedPreferences to save and load switch states
   - Programmatically creates UI elements to avoid massive XML layout

2. **CapabilityPreferenceHelper** (`smali_classes4/com/sec/android/app/camera/setting/CapabilityPreferenceHelper.smali`)
   - Helper class to access SharedPreferences from CapabilityImpl
   - Provides static methods: `setContext()`, `hasPreference()`, `getPreferenceBoolean()`
   - Initialized in CameraApplication.onCreate() with application context

3. **UI Resources**
   - Layout: `res/layout/activity_camera_capability_settings.xml` - Simple container with ScrollView
   - Strings: `res/values/strings.xml` - All 61 capability labels  
   - Menu: `res/menu/features_setting_menus.xml` - Menu item to launch settings
   
4. **AndroidManifest.xml**
   - Activity declaration for CameraCapabilitySettingsActivity

## All 61 Capabilities

The following capabilities can be toggled:

1. Action Shot
2. Advanced Zero Shutter Lag
3. AE/AF Lock
4. Auto Focus
5. Anamorphic Lens Preview
6. Auto Framing
7. Beauty Face
8. Beauty HAL Face Detection
9. Beauty HAL FD Tracking
10. Beauty In HAL
11. Bokeh Lighting
12. Bokeh Night
13. Bokeh Special Effect
14. Bokeh
15. Continuous AF
16. Color Space Display P3
17. Composition Guide
18. Depth
19. Document Detection HAL
20. Dynamic FOV
21. Dynamic Shot Info
22. Editable Portrait Video
23. Event Finder
24. Face Detection Full Mode
25. Face Detection
26. Focus Enhancer
27. Front Photo Night Mode
28. HDR10 Recording
29. Hyperlapse Astrography
30. Lens Distortion Correction
31. Live HDR
32. Log Video
33. Multi AF
34. Night Screen Flash
35. Object Detector
36. Pet Detection
37. Phase AF
38. Photo Palm Gesture
39. QR Code Detection HAL
40. Quick Take Animation
41. Recording Stop Trigger
42. Record Surface SSM FRC
43. Scene Optimizer
44. Selfie Tone Mode
45. Sensor Crop
46. Single Bokeh HAL
47. Smooth Zoom
48. Sub Preview Callback
49. Super Slow Motion GMC
50. Super Slow Motion QFRC
51. Super Slow Motion
52. SSM Auto Detect Cancel
53. Touch AE
54. Touch AF
55. Video Beauty Reconnect
56. Video Beauty Snapshot
57. Video Bokeh Effect
58. Video Color Space P3
59. Video Palm Gesture
60. Zoom Lock
61. ZSL Capture

## How It Works

### 1. User Interface Flow
1. User opens Camera app
2. User navigates to Settings → Features
3. User clicks on "Capability Settings" menu item
4. CameraCapabilitySettingsActivity launches
5. Activity dynamically creates 61 switches based on capability list
6. Each switch shows:
   - Capability name (from string resources)
   - Current state (from SharedPreferences or device default)
7. User toggles switches on/off
8. State is immediately saved to SharedPreferences

### 2. Preference Storage
- Preferences stored in: `camera_capability_prefs`
- Keys follow pattern: `{capability}_supported` (e.g., "af_supported", "caf_supported")
- Values: boolean (true/false)
- Default: true (enabled) if no preference set

### 3. Capability Override Integration
CapabilityImpl methods need to check SharedPreferences before returning device defaults:

```smali
.method public isAfSupported()Z
    .locals 2

    # Check if preference exists
    const-string v0, "af_supported"
    invoke-static {v0}, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->hasPreference(Ljava/lang/String;)Z
    move-result v1
    
    if-eqz v1, :cond_0
    # Return preference value
    iget-boolean v1, p0, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->mIsAfSupported:Z
    invoke-static {v0, v1}, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->getPreferenceBoolean(Ljava/lang/String;Z)Z
    move-result p0
    return p0
    
    :cond_0
    # Return device default
    iget-boolean p0, p0, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->mIsAfSupported:Z
    return p0
.end method
```

## Implementation Status

### ✅ Completed
- [x] XML layout for settings UI
- [x] 61 string resources for capability labels
- [x] CameraCapabilitySettingsActivity with dynamic switch generation
- [x] CapabilityPreferenceHelper for SharedPreferences access
- [x] Application context initialization in CameraApplication
- [x] Menu item and intent handler in FeaturesSettingActivity
- [x] AndroidManifest activity declaration
- [x] Example integration in CapabilityImpl (isAfSupported method)

### 🔄 To Complete
- [ ] Apply SharedPreferences checking to remaining 60 CapabilityImpl methods
- [ ] Build and test APK
- [ ] Verify all switches function correctly
- [ ] Take screenshots of UI

## Applying to Remaining Methods

To complete the implementation, apply the same pattern shown in `isAfSupported()` to these 60 methods:

1. `isActionShotSupported()` - use key "action_shot_supported"
2. `isAdvancedZeroShutterLagSupported()` - use key "advanced_zero_shutter_lag_supported"
3. `isAeAfLockSupported()` - use key "ae_af_lock_supported"
... (continue for all 61)

The pattern is consistent for all methods:
1. Add preference check at start
2. If preference exists, return preference value
3. Otherwise, return device default value

## Building the APK

```bash
# Rebuild APK
apktool b /home/runner/work/com_sec_android_app_camera/com_sec_android_app_camera -o camera_modified.apk

# Sign APK
apksigner sign --ks my-release-key.jks --out camera_signed.apk camera_modified.apk

# Install
adb install camera_signed.apk
```

## Testing

1. Install modified APK
2. Open Camera app
3. Go to Settings → Features → Capability Settings
4. Verify all 61 switches are displayed with correct labels
5. Toggle some switches and verify they save state
6. Restart app and verify saved states persist
7. Test camera functionality with different capability combinations

## Notes

- Initial switch state defaults to device capability (true/enabled)
- Changes take effect immediately
- Preferences persist across app restarts
- Settings are independent of camera mode
- No factory reset option currently implemented (can be added)

## File Locations

- Activity: `smali_classes4/com/sec/android/app/camera/setting/CameraCapabilitySettingsActivity.smali`
- Helper: `smali_classes4/com/sec/android/app/camera/setting/CapabilityPreferenceHelper.smali`
- Layout: `res/layout/activity_camera_capability_settings.xml`
- Strings: `res/values/strings.xml`
- Menu: `res/menu/features_setting_menus.xml`
- Integration: `smali_classes3/com/sec/android/app/camera/engine/core/CapabilityImpl.smali`
- Manifest: `AndroidManifest.xml`
- App Init: `smali_classes3/com/sec/android/app/camera/CameraApplication.smali`
