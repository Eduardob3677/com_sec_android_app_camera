# How to Build and Install Modified Samsung Camera APK

## Prerequisites

Before you begin, make sure you have:

1. **apktool** - For rebuilding the APK
   ```bash
   # Install on Linux/Mac
   brew install apktool
   # Or download from https://apktool.org/
   ```

2. **Java JDK** - Required by apktool
   ```bash
   java -version  # Should show version 8 or higher
   ```

3. **Android Platform Tools** - For installing the APK
   ```bash
   # Download from https://developer.android.com/tools/releases/platform-tools
   # Or install via package manager
   ```

4. **Keystore for Signing** - Create your own signing key

---

## Step 1: Build the Modified APK

### Navigate to parent directory
```bash
cd /path/to/com_sec_android_app_camera
cd ..
```

### Build APK with apktool
```bash
apktool b com_sec_android_app_camera -o camera_modified.apk
```

**Expected output:**
```
I: Using Apktool 2.x.x
I: Checking whether sources has changed...
I: Smaling smali folder into classes.dex...
I: Smaling smali_classes2 folder into classes2.dex...
I: Smaling smali_classes3 folder into classes3.dex...
I: Smaling smali_classes4 folder into classes4.dex...
I: Building resources...
I: Building apk file...
I: Copying unknown files/dir...
I: Built apk into: camera_modified.apk
```

**If you get errors:**
- Check that all .smali files have correct syntax
- Ensure AndroidManifest.xml is valid
- Verify resources are intact

---

## Step 2: Sign the APK

Android requires all APKs to be signed. You need to create a keystore and sign the APK.

### Option A: Create a new keystore (first time)
```bash
keytool -genkey -v -keystore camera-key.jks \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -alias camera-key
```

You'll be asked for:
- Keystore password (choose a secure password)
- Your name and organization details
- Key password (can be same as keystore password)

**Important:** Save this keystore file and remember the passwords! You'll need them for future updates.

### Option B: Sign with existing keystore
```bash
# Using jarsigner (traditional method)
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
    -keystore camera-key.jks \
    camera_modified.apk camera-key

# Using apksigner (recommended, requires Android SDK Build Tools)
apksigner sign --ks camera-key.jks \
    --out camera_modified_signed.apk \
    camera_modified.apk
```

### Verify the signature
```bash
# Using jarsigner
jarsigner -verify -verbose -certs camera_modified.apk

# Using apksigner
apksigner verify camera_modified_signed.apk
```

---

## Step 3: Prepare Your Device

### Enable Developer Options
1. Go to **Settings** → **About phone**
2. Tap **Build number** 7 times
3. Developer options are now enabled

### Enable USB Debugging and Unknown Sources
1. Go to **Settings** → **Developer options**
2. Enable **USB debugging**
3. Enable **Install unknown apps** for your file manager/ADB

### Backup Important Data
Before installing modified APK:
1. Backup your photos and videos
2. Note your camera settings/preferences
3. Consider backing up entire device

---

## Step 4: Uninstall Original Samsung Camera (Optional)

**⚠️ Warning:** You may not be able to uninstall the system camera app without root.

If Samsung Camera is a system app, you have two options:

### Option 1: Install as Separate App (Recommended)
- Modify the package name in AndroidManifest.xml before building
- This allows both apps to coexist
- Original app remains untouched

### Option 2: Install Over Original (May Not Work)
```bash
# Try to install over existing app
adb install -r camera_modified_signed.apk
```

This usually fails for system apps. If it fails, use Option 1 or root required.

---

## Step 5: Install the Modified APK

### Method A: Install via ADB (Recommended)
```bash
# Connect your device via USB
# Make sure USB debugging is enabled

# Check device is connected
adb devices

# Install the APK
adb install -r camera_modified_signed.apk

# Or if it's a new install (not replacing)
adb install camera_modified_signed.apk
```

**Expected output:**
```
Performing Streamed Install
Success
```

### Method B: Install via File Manager
1. Copy `camera_modified_signed.apk` to your device
2. Open file manager on device
3. Tap the APK file
4. Allow installation from this source if prompted
5. Tap **Install**

### Method C: Install via SD Card
1. Copy APK to SD card
2. Insert SD card into device
3. Use file manager to navigate to APK
4. Tap to install

---

## Step 6: Grant Permissions

After installation:

1. Open the modified Camera app
2. Grant all requested permissions:
   - Camera
   - Microphone
   - Storage/Files
   - Location (if prompted)

---

## Step 7: Verify the Modification Works

### Test 1: Low Battery Flash Test
1. Let battery drain below 15% (or use Battery Simulator app)
2. Open modified Camera app
3. Switch to **Video** mode
4. Tap the **Flash** icon
5. **Verify:** Flash should be available and toggleable
6. Start recording video with flash on
7. **Success:** Video records with flash at low battery

### Test 2: Normal Flash Test
1. Ensure battery is above 20%
2. Test flash in Photo mode
3. Test torch in Video mode
4. **Success:** All flash features work normally

---

## Troubleshooting

### Issue: "App not installed"
**Possible causes:**
- Signature mismatch (old version signed with different key)
- Corrupted APK
- Insufficient storage

**Solutions:**
```bash
# Uninstall old version completely
adb uninstall com.sec.android.app.camera

# Clear package installer cache
adb shell pm clear com.android.packageinstaller

# Try installing again
adb install camera_modified_signed.apk
```

### Issue: "App keeps crashing"
**Possible causes:**
- Smali syntax errors
- Missing resources
- Permission issues

**Solutions:**
1. Check logcat for errors:
   ```bash
   adb logcat | grep camera
   ```
2. Verify all smali files are valid
3. Rebuild APK carefully
4. Ensure all permissions are granted

### Issue: "Flash still disabled at low battery"
**Verification steps:**
1. Check that you installed the correct modified APK
2. Verify app signature (should be different from original)
3. Check app version in About section
4. Review logcat for any error messages

**Solution:**
- Ensure modifications were actually applied
- Rebuild and reinstall
- Check device-specific restrictions (some devices have hardware limitations)

### Issue: "Parse error: There is a problem parsing the package"
**Possible causes:**
- APK not properly signed
- Corrupted build
- Incompatible Android version

**Solutions:**
```bash
# Verify APK integrity
apksigner verify -v camera_modified_signed.apk

# Rebuild from scratch
rm camera_modified.apk
apktool b com_sec_android_app_camera -o camera_modified.apk
apksigner sign --ks camera-key.jks --out camera_modified_signed.apk camera_modified.apk
```

---

## Testing Checklist

After installation, verify these features work:

- [ ] App opens without crashing
- [ ] Camera preview displays correctly
- [ ] Flash toggles in Photo mode
- [ ] Flash toggles in Video mode (even at low battery)
- [ ] Video recording works with flash
- [ ] Flash works at battery levels below 15%
- [ ] All camera modes accessible (Portrait, Pro, Night, etc.)
- [ ] Settings are accessible
- [ ] Photos/videos save correctly
- [ ] Gallery integration works

---

## Important Notes

### About the Modifications
- Only flash restriction code was modified
- All other camera features remain unchanged
- UI and user experience are identical to original

### Safety Reminders
⚠️ **Please read SAFETY_WARNING.md before using!**

Key safety points:
1. Monitor battery level manually
2. Watch for device overheating
3. Stop immediately if device becomes hot
4. Don't use flash continuously for extended periods
5. Keep battery above 10% when using flash

### Samsung Services
The modified APK:
- ✅ Works as standalone camera app
- ❌ May not pass Samsung integrity checks
- ❌ May not work with Samsung Cloud sync
- ❌ May not work with Bixby Vision
- ⚠️ May void warranty

---

## Updating the Modified APK

To update in the future:

1. Make new modifications to smali code
2. Rebuild APK:
   ```bash
   apktool b com_sec_android_app_camera -o camera_modified_v2.apk
   ```
3. Sign with **the same keystore**:
   ```bash
   apksigner sign --ks camera-key.jks \
       --out camera_modified_v2_signed.apk \
       camera_modified_v2.apk
   ```
4. Install update:
   ```bash
   adb install -r camera_modified_v2_signed.apk
   ```

**Important:** Always use the same keystore for updates, or you'll need to uninstall first.

---

## Reverting to Original

To restore the official Samsung Camera:

### Method 1: From Galaxy Store
1. Open Galaxy Store
2. Search for "Samsung Camera"
3. Install official version
4. It will replace the modified version

### Method 2: From APK
1. Download official Samsung Camera APK
2. Install over modified version
3. Grant all permissions

### Method 3: Factory Reset (Nuclear Option)
- This will restore all system apps to original
- **Warning:** This erases all data!

---

## Advanced: Changing Package Name

To install alongside original camera:

1. Edit `AndroidManifest.xml`:
   ```xml
   <!-- Change package name -->
   <manifest package="com.sec.android.app.camera.modded" ... >
   ```

2. Update all references in smali files (search and replace):
   ```
   com/sec/android/app/camera → com/sec/android/app/camera/modded
   ```

3. Rebuild and sign as normal

4. This creates a separate app that coexists with original

---

## Support and Help

### If You Need Help:
1. Check logcat for error messages:
   ```bash
   adb logcat -s CameraApp:* AndroidRuntime:E *:E
   ```

2. Verify modifications:
   ```bash
   grep -r "Modified:" com_sec_android_app_camera/smali_classes3/
   ```

3. Review documentation:
   - README.md - General information
   - FLASH_RESTRICTIONS_REMOVED.md - Technical details
   - SAFETY_WARNING.md - Safety guidelines

### Common Commands Reference:
```bash
# Device info
adb devices
adb shell getprop ro.build.version.release

# Install APK
adb install -r camera_modified_signed.apk

# Uninstall
adb uninstall com.sec.android.app.camera

# View logs
adb logcat

# Grant permission manually
adb shell pm grant com.sec.android.app.camera android.permission.CAMERA
```

---

## Summary

✅ **You've successfully:**
1. Built modified APK with flash restrictions removed
2. Signed the APK with your keystore
3. Installed on your device
4. Verified flash works at any battery level

⚠️ **Remember:**
- Monitor battery and temperature
- Read safety warnings
- Use responsibly
- Keep backup of original app

**Enjoy your unrestricted camera flash!** 📸

---

**Version:** 1.0  
**Last Updated:** January 2, 2026  
**Status:** Complete Build Instructions
