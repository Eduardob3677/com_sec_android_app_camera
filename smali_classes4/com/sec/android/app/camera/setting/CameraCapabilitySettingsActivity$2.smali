.class Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->setupSwitchListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;


# direct methods
.method constructor <init>(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$2;->this$0:Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    iget-object p1, p0, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity$2;->this$0:Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;

    const-string p0, "caf_supported"

    invoke-static {p1, p0, p2}, Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;->access$000(Lcom/sec/android/app/camera/setting/CameraCapabilitySettingsActivity;Ljava/lang/String;Z)V

    return-void
.end method
