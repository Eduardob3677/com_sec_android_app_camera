#!/usr/bin/env python3
"""
Automated script to modify CapabilityImpl.smali to add SharedPreferences override logic.
This script modifies 62 capability methods to check preferences before returning hardware values.
"""

import re
import sys

# Mapping of method names to preference keys
CAPABILITY_METHODS = {
    'isActionShotSupported': 'cap_is_action_shot_supported',
    'isAdvancedZeroShutterLagSupported': 'cap_is_advanced_zero_shutter_lag_supported',
    'isAeAfLockSupported': 'cap_is_ae_af_lock_supported',
    'isAfSupported': 'cap_is_af_supported',
    'isAnamorphicLensPreviewSupported': 'cap_is_anamorphic_lens_preview_supported',
    'isAutoFramingSupported': 'cap_is_auto_framing_supported',
    'isBeautyFaceSupported': 'cap_is_beauty_face_supported',
    'isBeautyInHalFaceDetectionSupported': 'cap_is_beauty_in_hal_face_detection_supported',
    'isBeautyInHalFaceDetectionTrackingSupported': 'cap_is_beauty_in_hal_face_detection_tracking_supported',
    'isBeautyInHalSupported': 'cap_is_beauty_in_hal_supported',
    'isBokehLightingSupported': 'cap_is_bokeh_lighting_supported',
    'isBokehNightSupported': 'cap_is_bokeh_night_supported',
    'isBokehSpecialEffectSupported': 'cap_is_bokeh_special_effect_supported',
    'isBokehSupported': 'cap_is_bokeh_supported',
    'isCafSupported': 'cap_is_caf_supported',
    'isColorSpaceModeDisplayP3Supported': 'cap_is_color_space_mode_display_p3_supported',
    'isCompositionGuideSupported': 'cap_is_composition_guide_supported',
    'isDepthSupported': 'cap_is_depth_supported',
    'isDocumentDetectionInHalSupported': 'cap_is_document_detection_in_hal_supported',
    'isDynamicFovSupported': 'cap_is_dynamic_fov_supported',
    'isDynamicShotInfoSupported': 'cap_is_dynamic_shot_info_supported',
    'isEditablePortraitVideoSupported': 'cap_is_editable_portrait_video_supported',
    'isEventFinderSupported': 'cap_is_event_finder_supported',
    'isFaceDetectionFullModeSupported': 'cap_is_face_detection_full_mode_supported',
    'isFaceDetectionSupported': 'cap_is_face_detection_supported',
    'isFocusEnhancerSupported': 'cap_is_focus_enhancer_supported',
    'isFrontPhotoNightModeSupported': 'cap_is_front_photo_night_mode_supported',
    'isFusionHighResolutionSupported': 'cap_is_fusion_high_resolution_supported',
    'isHyperlapseAstrographySupported': 'cap_is_hyperlapse_astrography_supported',
    'isHyperlapseTrailModeSupported': 'cap_is_hyperlapse_trail_mode_supported',
    'isLensDistortionCorrectionSupported': 'cap_is_lens_distortion_correction_supported',
    'isLiveHdrSupported': 'cap_is_live_hdr_supported',
    'isLogVideoSupported': 'cap_is_log_video_supported',
    'isMultiAfSupported': 'cap_is_multi_af_supported',
    'isNightScreenFlashSupported': 'cap_is_night_screen_flash_supported',
    'isObjectDetectorSupported': 'cap_is_object_detector_supported',
    'isPetDetectionSupported': 'cap_is_pet_detection_supported',
    'isPhaseAfSupported': 'cap_is_phase_af_supported',
    'isPhotoPalmGestureDetectionSupported': 'cap_is_photo_palm_gesture_detection_supported',
    'isQrCodeDetectionInHalSupported': 'cap_is_qr_code_detection_in_hal_supported',
    'isQuickTakeRecordingAnimationCallbackSupported': 'cap_is_quick_take_recording_animation_callback_supported',
    'isRemovingRecordSurfaceWhileSsmFrcSupported': 'cap_is_removing_record_surface_while_ssm_frc_supported',
    'isSceneOptimizerSupported': 'cap_is_scene_optimizer_supported',
    'isSelfieToneModeSupported': 'cap_is_selfie_tone_mode_supported',
    'isSensorCropSupported': 'cap_is_sensor_crop_supported',
    'isSingleBokehInHalSupported': 'cap_is_single_bokeh_in_hal_supported',
    'isSlowMotionResolutionSupported': 'cap_is_slow_motion_resolution_supported',
    'isSmoothZoomSupported': 'cap_is_smooth_zoom_supported',
    'isSubPreviewCallbackSupported': 'cap_is_sub_preview_callback_supported',
    'isSuperSlowMotionGmcSupported': 'cap_is_super_slow_motion_gmc_supported',
    'isQFrcSupported': 'cap_is_super_slow_motion_qfrc_supported',
    'isSuperSlowMotionSupported': 'cap_is_super_slow_motion_supported',
    'isSyncCancelSuperSlowMotionAutoDetectSupported': 'cap_is_sync_cancel_super_slow_motion_auto_detect_supported',
    'isTouchAeSupported': 'cap_is_touch_ae_supported',
    'isTouchAfSupported': 'cap_is_touch_af_supported',
    'isVideoBeautyFaceSupported': 'cap_is_video_beauty_face_supported',
    'isVideoBeautySnapshotSupported': 'cap_is_video_beauty_snapshot_supported',
    'isVideoBokehEffectSupported': 'cap_is_video_bokeh_effect_supported',
    'isVideoColorSpaceModeDisplayP3Supported': 'cap_is_video_color_space_mode_display_p3_supported',
    'isVideoPalmGestureDetectionSupported': 'cap_is_video_palm_gesture_detection_supported',
    'isVideoResolutionSupported': 'cap_is_video_resolution_supported',
    'isZoomLockSupported': 'cap_is_zoom_lock_supported',
    'isZslCaptureSupported': 'cap_is_zsl_capture_supported',
}

def extract_method_body(content, method_name):
    """Extract the body of a method from smali content."""
    pattern = rf'\.method public {method_name}\(\)Z\n(.*?)\.end method'
    match = re.search(pattern, content, re.DOTALL)
    if match:
        return match.group(1)
    return None

def create_preference_check_wrapper(method_name, pref_key, original_body):
    """Create the preference check wrapper code."""
    # Increase locals to 5 to accommodate additional variables
    original_body_modified = original_body.replace('.locals 1', '.locals 5')
    if '.locals 2' in original_body_modified:
        original_body_modified = original_body_modified.replace('.locals 2', '.locals 5')
    
    wrapper = f'''    # Try to get SharedPreferences and check for override
    :try_start_pref
    invoke-static {{}}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    
    move-result-object v0
    
    if-eqz v0, :cond_default
    
    const-string v1, "pref_camera_capabilities"
    
    const/4 v2, 0x0
    
    invoke-virtual {{v0, v1, v2}}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    
    move-result-object v0
    
    const-string v1, "{pref_key}"
    
    invoke-interface {{v0, v1}}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    
    move-result v3
    
    if-eqz v3, :cond_default
    
    # Preference exists, get its value (default to false for safety)
    const/4 v3, 0x0
    
    invoke-interface {{v0, v1, v3}}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    
    move-result v4
    
    return v4
    :try_end_pref
    .catch Ljava/lang/Exception; :try_start_pref :try_end_pref :catch_pref
    
    :catch_pref
    # If any exception occurs, fall through to default behavior
    
    :cond_default
    # Original hardware capability check
'''
    
    # Clean up the original body - remove the .locals declaration
    lines = original_body_modified.split('\n')
    cleaned_lines = [line for line in lines if not line.strip().startswith('.locals')]
    original_body_clean = '\n'.join(cleaned_lines)
    
    return wrapper + original_body_clean

def modify_capability_method(content, method_name, pref_key):
    """Modify a single capability method to add preference checking."""
    # Find the method
    pattern = rf'(\.method public {method_name}\(\)Z\n)(.*?)(\.end method)'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        print(f"Warning: Method {method_name} not found")
        return content
    
    method_start = match.group(1)
    method_body = match.group(2)
    method_end = match.group(3)
    
    # Extract .locals declaration
    locals_match = re.search(r'\.locals (\d+)', method_body)
    if not locals_match:
        print(f"Warning: No .locals found in {method_name}")
        return content
    
    # Create wrapped version
    wrapped_body = create_preference_check_wrapper(method_name, pref_key, method_body)
    
    # Replace in content
    new_method = method_start + wrapped_body + '\n' + method_end
    modified_content = content[:match.start()] + new_method + content[match.end():]
    
    return modified_content

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 modify_capability_impl.py <path_to_CapabilityImpl.smali>")
        sys.exit(1)
    
    smali_file = sys.argv[1]
    
    print(f"Reading {smali_file}...")
    with open(smali_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print(f"Modifying {len(CAPABILITY_METHODS)} capability methods...")
    modified_count = 0
    
    for method_name, pref_key in CAPABILITY_METHODS.items():
        print(f"  Modifying {method_name}...")
        new_content = modify_capability_method(content, method_name, pref_key)
        if new_content != content:
            modified_count += 1
            content = new_content
        else:
            print(f"    Warning: {method_name} was not modified")
    
    # Write back
    backup_file = smali_file + '.backup'
    print(f"\nCreating backup at {backup_file}...")
    with open(backup_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Writing modified file to {smali_file}...")
    with open(smali_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"\nComplete! Modified {modified_count}/{len(CAPABILITY_METHODS)} methods.")
    print(f"Original file backed up to {backup_file}")

if __name__ == '__main__':
    main()
