.class public Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# static fields
.field private static final PREFS_NAME:Ljava/lang/String; = "camera_capability_prefs"

.field private static final TAG:Ljava/lang/String; = "CapabilitySettings"


# instance fields
.field private mCapabilitiesContainer:Landroid/widget/LinearLayout;

.field private mContext:Landroid/content/Context;

.field private mSharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private addCapabilitySwitch(Ljava/lang/String;I)V
    .locals 8

    # Create horizontal LinearLayout
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x8

    invoke-virtual {v2, v1, v5, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Create TextView for label
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41800000    # 16.0f

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v5, -0x1000000

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v1, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Create Switch
    new-instance v5, Landroidx/appcompat/widget/SwitchCompat;

    invoke-direct {v5, p0}, Landroidx/appcompat/widget/SwitchCompat;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # Load saved preference or device default
    iget-object v4, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const/4 v6, 0x1

    invoke-interface {v4, p1, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v5, v4}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    # Set listener
    new-instance v4, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$1;

    invoke-direct {v4, p0, p1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$1;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    # Add views to container
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mCapabilitiesContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private initializeCapabilitySwitches()V
    .locals 2

    const-string v0, "action_shot_supported"

    const v1, 0x7f130047    # R.string.cap_action_shot_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "advanced_zero_shutter_lag_supported"

    const v1, 0x7f130048    # R.string.cap_advanced_zero_shutter_lag_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "ae_af_lock_supported"

    const v1, 0x7f130049    # R.string.cap_ae_af_lock_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "af_supported"

    const v1, 0x7f13004a    # R.string.cap_af_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "anamorphic_lens_preview_supported"

    const v1, 0x7f13004b    # R.string.cap_anamorphic_lens_preview_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "auto_framing_supported"

    const v1, 0x7f13004c    # R.string.cap_auto_framing_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "beauty_face_supported"

    const v1, 0x7f13004d    # R.string.cap_beauty_face_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "beauty_in_hal_face_detection_supported"

    const v1, 0x7f13004e    # R.string.cap_beauty_in_hal_face_detection_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "beauty_in_hal_face_detection_tracking_supported"

    const v1, 0x7f13004f    # R.string.cap_beauty_in_hal_face_detection_tracking_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "beauty_in_hal_supported"

    const v1, 0x7f130050    # R.string.cap_beauty_in_hal_supported

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "bokeh_lighting_supported"

    const v1, 0x7f130051

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "bokeh_night_supported"

    const v1, 0x7f130052

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "bokeh_special_effect_supported"

    const v1, 0x7f130053

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "bokeh_supported"

    const v1, 0x7f130054

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "caf_supported"

    const v1, 0x7f130055

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "color_space_mode_display_p3_supported"

    const v1, 0x7f130056

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "composition_guide_supported"

    const v1, 0x7f130057

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "depth_supported"

    const v1, 0x7f130058

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "document_detection_in_hal_supported"

    const v1, 0x7f130059

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "dynamic_fov_supported"

    const v1, 0x7f13005a

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "dynamic_shot_info_supported"

    const v1, 0x7f13005b

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "editable_portrait_video_supported"

    const v1, 0x7f13005c

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "event_finder_supported"

    const v1, 0x7f13005d

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "face_detection_full_mode_supported"

    const v1, 0x7f13005e

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "face_detection_supported"

    const v1, 0x7f13005f

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "focus_enhancer_supported"

    const v1, 0x7f130060

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "front_photo_night_mode_supported"

    const v1, 0x7f130061

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "hdr10_recording_available"

    const v1, 0x7f130062

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "hyperlapse_astrography_supported"

    const v1, 0x7f130063

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "lens_distortion_correction_supported"

    const v1, 0x7f130064

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "live_hdr_supported"

    const v1, 0x7f130065

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "log_video_supported"

    const v1, 0x7f130066

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "multi_af_supported"

    const v1, 0x7f130067

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "night_screen_flash_supported"

    const v1, 0x7f130068

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "object_detector_supported"

    const v1, 0x7f130069

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "pet_detection_supported"

    const v1, 0x7f13006a

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "phase_af_supported"

    const v1, 0x7f13006b

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "photo_palm_gesture_detection_supported"

    const v1, 0x7f13006c

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "qr_code_detection_in_hal_supported"

    const v1, 0x7f13006d

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "quick_take_recording_animation_callback_supported"

    const v1, 0x7f13006e

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "recording_stop_trigger_required"

    const v1, 0x7f13006f

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "removing_record_surface_while_ssm_frc_supported"

    const v1, 0x7f130070

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "scene_optimizer_supported"

    const v1, 0x7f130071

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "selfie_tone_mode_supported"

    const v1, 0x7f130072

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "sensor_crop_supported"

    const v1, 0x7f130073

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "single_bokeh_in_hal_supported"

    const v1, 0x7f130074

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "smooth_zoom_supported"

    const v1, 0x7f130075

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "sub_preview_callback_supported"

    const v1, 0x7f130076

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "super_slow_motion_gmc_supported"

    const v1, 0x7f130077

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "super_slow_motion_q_frc_supported"

    const v1, 0x7f130078

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "super_slow_motion_supported"

    const v1, 0x7f130079

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "sync_cancel_super_slow_motion_auto_detect_supported"

    const v1, 0x7f13007a

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "touch_ae_supported"

    const v1, 0x7f13007b

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "touch_af_supported"

    const v1, 0x7f13007c

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "video_beauty_reconnect_maker_required"

    const v1, 0x7f13007d

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "video_beauty_snapshot_supported"

    const v1, 0x7f13007e

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "video_bokeh_effect_supported"

    const v1, 0x7f13007f

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "video_color_space_mode_display_p3_supported"

    const v1, 0x7f130080

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "video_palm_gesture_detection_supported"

    const v1, 0x7f130081

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "zoom_lock_supported"

    const v1, 0x7f130082

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    const-string v0, "zsl_capture_supported"

    const v1, 0x7f130083

    invoke-direct {p0, v0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->addCapabilitySwitch(Ljava/lang/String;I)V

    return-void
.end method

.method private savePreference(Ljava/lang/String;Z)V
    .locals 1

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic access$000(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->savePreference(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    iput-object p0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mContext:Landroid/content/Context;

    const p1, 0x7f0d0021    # R.layout.activity_camera_capability_settings

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    const-string p1, "camera_capability_prefs"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const p1, 0x7f0a05e8    # R.id.capabilities_container

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mCapabilitiesContainer:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->initializeCapabilitySwitches()V

    return-void
.end method
