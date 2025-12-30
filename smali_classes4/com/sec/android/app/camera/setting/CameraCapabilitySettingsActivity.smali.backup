.class public Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# static fields
.field private static final PREFS_NAME:Ljava/lang/String; = "camera_capability_prefs"

.field private static final TAG:Ljava/lang/String; = "CapabilitySettings"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mSharedPreferences:Landroid/content/SharedPreferences;

.field private switchAfSupported:Landroidx/appcompat/widget/SwitchCompat;

.field private switchCafSupported:Landroidx/appcompat/widget/SwitchCompat;

.field private switchAfRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

.field private switchAeRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

.field private switchFaceDetectionFull:Landroidx/appcompat/widget/SwitchCompat;

.field private switchFaceDetectionSimple:Landroidx/appcompat/widget/SwitchCompat;

.field private switchLensDistortionCorrection:Landroidx/appcompat/widget/SwitchCompat;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private getDeviceDefaultValue(Ljava/lang/String;)Z
    .locals 0

    # For now, return true for all capabilities as device default
    const/4 p0, 0x1

    return p0
.end method

.method private initializeSwitches()V
    .locals 3

    const v0, 0x7f0a05e1    # R.id.switch_af_supported

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfSupported:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e2    # R.id.switch_caf_supported

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchCafSupported:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e3    # R.id.switch_af_regions_supported

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e4    # R.id.switch_ae_regions_supported

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAeRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e5    # R.id.switch_face_detection_full

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionFull:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e6    # R.id.switch_face_detection_simple

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionSimple:Landroidx/appcompat/widget/SwitchCompat;

    const v0, 0x7f0a05e7    # R.id.switch_lens_distortion_correction

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchLensDistortionCorrection:Landroidx/appcompat/widget/SwitchCompat;

    # Load saved preferences or device defaults
    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->loadPreferences()V

    # Set up switch listeners
    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->setupSwitchListeners()V

    return-void
.end method

.method private loadPreferences()V
    .locals 3

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "af_supported"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfSupported:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "caf_supported"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchCafSupported:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "af_regions_supported"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "ae_regions_supported"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAeRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "face_detection_full"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionFull:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "face_detection_simple"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionSimple:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "lens_distortion_correction"

    invoke-direct {p0, v1}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->getDeviceDefaultValue(Ljava/lang/String;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchLensDistortionCorrection:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

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

.method private setupSwitchListeners()V
    .locals 2

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfSupported:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$1;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$1;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchCafSupported:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$2;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$2;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAfRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$3;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$3;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchAeRegionsSupported:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$4;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$4;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionFull:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$5;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$5;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchFaceDetectionSimple:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$6;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$6;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->switchLensDistortionCorrection:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$7;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$7;-><init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

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

    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->initializeSwitches()V

    return-void
.end method
