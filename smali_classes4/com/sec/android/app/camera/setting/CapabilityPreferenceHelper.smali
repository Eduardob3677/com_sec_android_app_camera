.class public Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final PREFS_NAME:Ljava/lang/String; = "camera_capability_prefs"

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPreferenceBoolean(Ljava/lang/String;Z)Z
    .locals 2

    sget-object v0, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->sContext:Landroid/content/Context;

    if-nez v0, :cond_0

    return p1

    :cond_0
    const-string v1, "camera_capability_prefs"

    const/4 v0, 0x0

    invoke-static {v1, v0}, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-nez v0, :cond_1

    return p1

    :cond_1
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .locals 1

    sget-object v0, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->sContext:Landroid/content/Context;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {v0, p0, p1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static hasPreference(Ljava/lang/String;)Z
    .locals 2

    sget-object v0, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->sContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "camera_capability_prefs"

    invoke-static {v0, v1}, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lcom/sec/android/app/camera/setting/CapabilityPreferenceHelper;->sContext:Landroid/content/Context;

    :cond_0
    return-void
.end method
