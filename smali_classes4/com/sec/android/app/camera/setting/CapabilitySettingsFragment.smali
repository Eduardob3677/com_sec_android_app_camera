.class public Lcom/sec/android/app/camera/setting/CapabilitySettingsFragment;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/sec/android/app/camera/setting/CapabilitySettingsFragment;
    .locals 1

    new-instance v0, Lcom/sec/android/app/camera/setting/CapabilitySettingsFragment;

    invoke-direct {v0}, Lcom/sec/android/app/camera/setting/CapabilitySettingsFragment;-><init>()V

    if-eqz p0, :cond_0

    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    # Launch CapabilitySettingsActivity
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-class p0, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;

    invoke-direct {p1, v0, p0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    # Finish the SubCameraSettingActivity so it doesn't remain in back stack
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    # Empty implementation - we launch the activity in onCreate
    return-void
.end method
