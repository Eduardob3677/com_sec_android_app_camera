#!/bin/bash
# Add preference checks to the remaining parametrized methods

FILE="smali_classes3/com/sec/android/app/camera/engine/core/CapabilityImpl.smali"

# Function to add preference check to a method
add_pref_check() {
    local method_name="$1"
    local pref_key="$2"
    local method_sig="$3"
    
    # Find the method and extract it
    python3 << PYTHON
import re

with open("$FILE", "r") as f:
    content = f.read()

# Find the method
pattern = r'(\.method public ${method_name}${method_sig}\n\s+\.locals\s+\d+\n)(.*?)(\.end method)'
match = re.search(pattern, content, re.DOTALL)

if match:
    method_start = match.group(1)
    method_body = match.group(2)
    method_end = match.group(3)
    
    # Extract locals value and increase it
    locals_match = re.search(r'\.locals (\d+)', method_start)
    if locals_match:
        old_locals = int(locals_match.group(1))
        new_locals = max(old_locals, 5)
        method_start = method_start.replace(f'.locals {old_locals}', f'.locals {new_locals}')
    
    # Create preference check
    pref_check = '''    # Try to get SharedPreferences and check for override
    :try_start_pref
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    
    move-result-object v0
    
    if-eqz v0, :cond_default
    
    const-string v1, "pref_camera_capabilities"
    
    const/4 v2, 0x0
    
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    
    move-result-object v0
    
    const-string v1, "${pref_key}"
    
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z
    
    move-result v3
    
    if-eqz v3, :cond_default
    
    # Preference exists, get its value (default to false for safety)
    const/4 v3, 0x0
    
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    
    move-result v4
    
    return v4
    :try_end_pref
    .catch Ljava/lang/Exception; :try_start_pref :try_end_pref :catch_pref
    
    :catch_pref
    # If any exception occurs, fall through to default behavior
    
    :cond_default
    # Original hardware capability check
'''
    
    # Combine
    new_method = method_start + pref_check + method_body + method_end
    
    # Replace in content
    new_content = content[:match.start()] + new_method + content[match.end():]
    
    with open("$FILE", "w") as f:
        f.write(new_content)
    
    print(f"Modified ${method_name}")
else:
    print(f"Method ${method_name} not found")
PYTHON
}

# Add checks for the 3 remaining methods
add_pref_check "isHyperlapseTrailModeSupported" "cap_is_hyperlapse_trail_mode_supported" "\(I\)Z"
add_pref_check "isSlowMotionResolutionSupported" "cap_is_slow_motion_resolution_supported" "\(Lcom/sec/android/app/camera/interfaces/Resolution;\)Z"
add_pref_check "isVideoBeautyFaceSupported" "cap_is_video_beauty_face_supported" "\(Landroid/util/Size;I\)Z"
add_pref_check "isVideoResolutionSupported" "cap_is_video_resolution_supported" "\(Lcom/sec/android/app/camera/interfaces/Resolution;\)Z"

echo "Done adding preference checks to remaining methods"
