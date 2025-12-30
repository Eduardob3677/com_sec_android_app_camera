.class public Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "CapabilitySettings"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    # Set content view
    const v0, 0x7f0d0022    # activity_capability_settings

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    # Set title
    const v0, 0x7f130177    # capability_settings_title

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTitle(I)V

    # Setup switches
    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->setupCapabilitySwitches()V

    # Setup reset button
    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->setupResetButton()V

    return-void
.end method

.method private setupCapabilitySwitches()V
    .locals 13

    # Get container
    const v0, 0x7f0a00d3    # capability_switches_container

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-nez v0, :continue_setup

    const-string v1, "CapabilitySettings"

    const-string v2, "Container not found"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :continue_setup
    # Create CapabilityImpl instance to get device defaults
    invoke-static {}, Lcom/sec/android/app/camera/engine/CameraApplication;->getCameraApplication()Lcom/sec/android/app/camera/CameraApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sec/android/app/camera/CameraApplication;->getCameraDeviceManager()Lcom/sec/android/app/camera/device/CameraDeviceManager;

    move-result-object v1

    # TODO: Get CamCapability and create CapabilityImpl
    # For now, we'll create switches programmatically

    # Add capability switches (example for first few)
    const-string v2, "capability_isActionShotSupported"

    const v3, 0x7f130179    # string resource for title

    invoke-direct {p0, v0, v2, v3}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->addCapabilitySwitch(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    const-string v2, "capability_isAdvancedZeroShutterLagSupported"

    const v3, 0x7f13017a

    invoke-direct {p0, v0, v2, v3}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->addCapabilitySwitch(Landroid/widget/LinearLayout;Ljava/lang/String;I)V

    # Add more switches...
    # (In production, loop through all capability names)

    return-void
.end method

.method private addCapabilitySwitch(Landroid/widget/LinearLayout;Ljava/lang/String;I)V
    .locals 5

    # Inflate switch item layout
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0023    # capability_switch_item

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    # Get switch view
    const v1, 0x7f0a00d2    # capability_switch

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    # Set switch text
    invoke-virtual {v1, p3}, Landroid/widget/Switch;->setText(I)V

    # Get current value from SharedPreferences
    const-string v3, "pref_capability_overrides"

    invoke-virtual {p0, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    # Check if override exists
    invoke-interface {v3, p2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :use_default

    # Get override value
    invoke-interface {v3, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    goto :set_listener

    :use_default
    # TODO: Get device default value from CapabilityImpl
    # For now, set to false
    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    :set_listener
    # Set change listener
    new-instance v2, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;

    invoke-direct {v2, p0, p2}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;-><init>(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    # Add to container
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private setupResetButton()V
    .locals 2

    const v0, 0x7f0a00d1    # capability_reset_all_button

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    if-eqz v0, :return

    new-instance v1, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$2;

    invoke-direct {v1, p0}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$2;-><init>(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :return
    return-void
.end method

.method static synthetic access$000(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->saveCapabilityOverride(Ljava/lang/String;Z)V

    return-void
.end method

.method private saveCapabilityOverride(Ljava/lang/String;Z)V
    .locals 2

    const-string v0, "pref_capability_overrides"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method static synthetic access$100(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->resetAllCapabilities()V

    return-void
.end method

.method private resetAllCapabilities()V
    .locals 2

    const-string v0, "pref_capability_overrides"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    # Recreate activity to refresh switches
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->recreate()V

    return-void
.end method
