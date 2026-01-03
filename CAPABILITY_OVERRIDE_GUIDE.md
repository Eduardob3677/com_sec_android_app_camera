# Camera Advanced Settings - CapabilityImpl Modification Guide

## Overview
This document explains how to modify the CapabilityImpl.smali file to read capability overrides from SharedPreferences. The UI and menu system are complete; this guide shows how to connect the preference switches to the actual capability checks.

## Context
- **SharedPreferences File**: `pref_camera_capabilities`
- **Location**: `smali_classes3/com/sec/android/app/camera/engine/core/CapabilityImpl.smali`
- **Total Methods to Modify**: 62 capability methods

## Pattern for Modification

### Original Method Structure
Each capability method currently looks like this (using `isActionShotSupported` as example):

```smali
.method public isActionShotSupported()Z
    .locals 1

    iget-object p0, p0, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->mCamCapability:Lcom/samsung/android/camera/core2/CamCapability;
    
    iget-object p0, p0, Lcom/samsung/android/camera/core2/CamCapability;->e:Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;
    
    iget-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    if-nez v0, :cond_0
    
    const/16 v0, 0x44
    
    invoke-static {p0, v0}, Lb/a;->d(Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;I)Ljava/lang/Boolean;
    
    move-result-object v0
    
    iput-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    
    move-result p0
    
    return p0
.end method
```

### Modified Method Structure with Preference Override

The modified version should check SharedPreferences first, then fall back to hardware value:

```smali
.method public isActionShotSupported()Z
    .locals 4

    # Try to get Application context for SharedPreferences
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    
    move-result-object v0
    
    if-eqz v0, :cond_default
    
    # Get SharedPreferences
    const-string v1, "pref_camera_capabilities"
    
    const/4 v2, 0x0
    
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    
    move-result-object v0
    
    # Check if preference exists for this capability
    const-string v1, "cap_is_action_shot_supported"
    
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    
    move-result v3
    
    if-eqz v3, :cond_default
    
    # Get preference value (default to current hardware value)
    invoke-direct {p0}, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->getDefaultActionShotSupported()Z
    
    move-result v3
    
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    
    move-result p0
    
    return p0
    
    :cond_default
    # Original hardware capability check
    iget-object p0, p0, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->mCamCapability:Lcom/samsung/android/camera/core2/CamCapability;
    
    iget-object p0, p0, Lcom/samsung/android/camera/core2/CamCapability;->e:Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;
    
    iget-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    if-nez v0, :cond_0
    
    const/16 v0, 0x44
    
    invoke-static {p0, v0}, Lb/a;->d(Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;I)Ljava/lang/Boolean;
    
    move-result-object v0
    
    iput-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    
    move-result p0
    
    return p0
.end method

# Helper method to get default value
.method private getDefaultActionShotSupported()Z
    .locals 1

    iget-object p0, p0, Lcom/sec/android/app/camera/engine/core/CapabilityImpl;->mCamCapability:Lcom/samsung/android/camera/core2/CamCapability;
    
    iget-object p0, p0, Lcom/samsung/android/camera/core2/CamCapability;->e:Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;
    
    iget-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    if-nez v0, :cond_0
    
    const/16 v0, 0x44
    
    invoke-static {p0, v0}, Lb/a;->d(Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;I)Ljava/lang/Boolean;
    
    move-result-object v0
    
    iput-object v0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    :cond_0
    iget-object p0, p0, Lcom/samsung/android/camera/core2/local/capability/FeatureCapability;->d:Ljava/lang/Boolean;
    
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    
    move-result p0
    
    return p0
.end method
```

## List of Methods to Modify

All 62 methods follow the same pattern. Here's the mapping of method names to preference keys:

| Method Name | Preference Key |
|-------------|----------------|
| isActionShotSupported | cap_is_action_shot_supported |
| isAdvancedZeroShutterLagSupported | cap_is_advanced_zero_shutter_lag_supported |
| isAeAfLockSupported | cap_is_ae_af_lock_supported |
| isAfSupported | cap_is_af_supported |
| isAnamorphicLensPreviewSupported | cap_is_anamorphic_lens_preview_supported |
| isAutoFramingSupported | cap_is_auto_framing_supported |
| isBeautyFaceSupported | cap_is_beauty_face_supported |
| isBeautyInHalFaceDetectionSupported | cap_is_beauty_in_hal_face_detection_supported |
| isBeautyInHalFaceDetectionTrackingSupported | cap_is_beauty_in_hal_face_detection_tracking_supported |
| isBeautyInHalSupported | cap_is_beauty_in_hal_supported |
| isBokehLightingSupported | cap_is_bokeh_lighting_supported |
| isBokehNightSupported | cap_is_bokeh_night_supported |
| isBokehSpecialEffectSupported | cap_is_bokeh_special_effect_supported |
| isBokehSupported | cap_is_bokeh_supported |
| isCafSupported | cap_is_caf_supported |
| isColorSpaceModeDisplayP3Supported | cap_is_color_space_mode_display_p3_supported |
| isCompositionGuideSupported | cap_is_composition_guide_supported |
| isDepthSupported | cap_is_depth_supported |
| isDocumentDetectionInHalSupported | cap_is_document_detection_in_hal_supported |
| isDynamicFovSupported | cap_is_dynamic_fov_supported |
| isDynamicShotInfoSupported | cap_is_dynamic_shot_info_supported |
| isEditablePortraitVideoSupported | cap_is_editable_portrait_video_supported |
| isEventFinderSupported | cap_is_event_finder_supported |
| isFaceDetectionFullModeSupported | cap_is_face_detection_full_mode_supported |
| isFaceDetectionSupported | cap_is_face_detection_supported |
| isFocusEnhancerSupported | cap_is_focus_enhancer_supported |
| isFrontPhotoNightModeSupported | cap_is_front_photo_night_mode_supported |
| isFusionHighResolutionSupported | cap_is_fusion_high_resolution_supported |
| isHyperlapseAstrographySupported | cap_is_hyperlapse_astrography_supported |
| isHyperlapseTrailModeSupported | cap_is_hyperlapse_trail_mode_supported |
| isLensDistortionCorrectionSupported | cap_is_lens_distortion_correction_supported |
| isLiveHdrSupported | cap_is_live_hdr_supported |
| isLogVideoSupported | cap_is_log_video_supported |
| isMultiAfSupported | cap_is_multi_af_supported |
| isNightScreenFlashSupported | cap_is_night_screen_flash_supported |
| isObjectDetectorSupported | cap_is_object_detector_supported |
| isPetDetectionSupported | cap_is_pet_detection_supported |
| isPhaseAfSupported | cap_is_phase_af_supported |
| isPhotoPalmGestureDetectionSupported | cap_is_photo_palm_gesture_detection_supported |
| isQrCodeDetectionInHalSupported | cap_is_qr_code_detection_in_hal_supported |
| isQuickTakeRecordingAnimationCallbackSupported | cap_is_quick_take_recording_animation_callback_supported |
| isRemovingRecordSurfaceWhileSsmFrcSupported | cap_is_removing_record_surface_while_ssm_frc_supported |
| isSceneOptimizerSupported | cap_is_scene_optimizer_supported |
| isSelfieToneModeSupported | cap_is_selfie_tone_mode_supported |
| isSensorCropSupported | cap_is_sensor_crop_supported |
| isSingleBokehInHalSupported | cap_is_single_bokeh_in_hal_supported |
| isSlowMotionResolutionSupported | cap_is_slow_motion_resolution_supported |
| isSmoothZoomSupported | cap_is_smooth_zoom_supported |
| isSubPreviewCallbackSupported | cap_is_sub_preview_callback_supported |
| isSuperSlowMotionGmcSupported | cap_is_super_slow_motion_gmc_supported |
| isSuperSlowMotionQFrcSupported | cap_is_super_slow_motion_qfrc_supported |
| isSuperSlowMotionSupported | cap_is_super_slow_motion_supported |
| isSyncCancelSuperSlowMotionAutoDetectSupported | cap_is_sync_cancel_super_slow_motion_auto_detect_supported |
| isTouchAeSupported | cap_is_touch_ae_supported |
| isTouchAfSupported | cap_is_touch_af_supported |
| isVideoBeautyFaceSupported | cap_is_video_beauty_face_supported |
| isVideoBeautySnapshotSupported | cap_is_video_beauty_snapshot_supported |
| isVideoBokehEffectSupported | cap_is_video_bokeh_effect_supported |
| isVideoColorSpaceModeDisplayP3Supported | cap_is_video_color_space_mode_display_p3_supported |
| isVideoPalmGestureDetectionSupported | cap_is_video_palm_gesture_detection_supported |
| isVideoResolutionSupported | cap_is_video_resolution_supported |
| isZoomLockSupported | cap_is_zoom_lock_supported |
| isZslCaptureSupported | cap_is_zsl_capture_supported |

## Implementation Steps

1. **For each method** in the list above:
   - Find the method in `smali_classes3/com/sec/android/app/camera/engine/core/CapabilityImpl.smali`
   - Add the SharedPreferences check at the beginning (as shown in the pattern)
   - Keep the original hardware check as the fallback in `:cond_default`
   - Create a helper method `getDefaultXXX()` that returns the hardware capability value

2. **Testing**:
   - After modifying a method, rebuild the APK
   - Install and open Camera Advanced Settings
   - Toggle the corresponding switch
   - Verify the camera behavior changes according to the switch state

## Alternative Simpler Approach

If modifying 62 methods in smali is too complex, an alternative is to:

1. Create a Java wrapper class that intercepts capability checks
2. Compile it to smali
3. Modify only the CapabilityFactory to return the wrapper instead of CapabilityImpl

This would require adding new Java source code and recompiling, which may be easier than manual smali modifications.

## Notes

- The UI is fully functional and will save/load preference states correctly
- The menu integration is complete
- Only the capability override logic in CapabilityImpl needs to be completed
- Each capability method needs individual modification because they check different hardware capabilities
- The pattern is consistent across all methods, making it suitable for automation or script-based modification

## Automation Script

To automate this process, one could write a Python script that:
1. Parses each capability method in CapabilityImpl.smali
2. Extracts the original implementation
3. Wraps it with the SharedPreferences check
4. Writes the modified method back

This would reduce manual errors and save significant time.
