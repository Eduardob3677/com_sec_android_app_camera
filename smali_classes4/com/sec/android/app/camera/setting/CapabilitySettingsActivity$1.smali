.class Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->addCapabilitySwitch(Landroid/widget/LinearLayout;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;

.field final synthetic val$capabilityKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;->this$0:Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;

    iput-object p2, p0, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;->val$capabilityKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    iget-object p1, p0, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;->this$0:Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;

    iget-object p0, p0, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity$1;->val$capabilityKey:Ljava/lang/String;

    invoke-static {p1, p0, p2}, Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;->access$000(Lcom/sec/android/app/camera/setting/CapabilitySettingsActivity;Ljava/lang/String;Z)V

    return-void
.end method
