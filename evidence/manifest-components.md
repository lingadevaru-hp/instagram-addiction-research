# Component Inventory — com.instagram.android v455.0.0.51.72 (versionCode 386113969)

Decoded with apktool 3.0.3 from the verified base APK (SHA-256 `8fbecebd8608ff96ea0fb5046f5d2de0d0489081f0b561a65ca1e4b7fd0ca37e`).
Source: `artifacts/apk-decode/AndroidManifest.xml` (261 KB). Regenerate with the greps shown under each table.

## Engagement-relevant permissions

```
android.permission.FOREGROUND_SERVICE
android.permission.FOREGROUND_SERVICE_CAMERA
android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE
android.permission.FOREGROUND_SERVICE_DATA_SYNC
android.permission.FOREGROUND_SERVICE_LOCATION
android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK
android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION
android.permission.FOREGROUND_SERVICE_MICROPHONE
android.permission.FOREGROUND_SERVICE_PHONE_CALL
android.permission.POST_NOTIFICATIONS
android.permission.RECEIVE_BOOT_COMPLETED
android.permission.UPDATE_APP_BADGE
android.permission.WAKE_LOCK
```

## Push / notification / sync services (patch targets)

| Component | Type |
|---|---|
| `androidx.work.impl.background.systemalarm.RescheduleReceiver` | receiver |
| `androidx.work.impl.background.systemjob.SystemJobService` | service |
| `com.facebook.analytics2.fabric.onefabric.FFAlarmUploadJobService` | service |
| `com.facebook.analytics2.fabric.onefabric.OneFabricUploadAlarmReceiver` | receiver |
| `com.facebook.analytics2.logger.legacy.uploader.AlarmBasedUploadService` | service |
| `com.facebook.cameracore.mediapipeline.asyncscripting.AsyncScriptingService` | service |
| `com.facebook.common.errorreporting.memory.service.jobschedulercompat.igsvc.DumperUploadService` | service |
| `com.facebook.errorreporting.lacrima.detector.broadcast.SecureShutdownBootBroadcastReceiver` | receiver |
| `com.facebook.odinusecases.devicestatesnapshot.ig4a.PreloadsFbnsUnlockSignalReceiver` | receiver |
| `com.facebook.oxygen.preloads.sdk.firstparty.managedappcache.IsManagedAppCacheJobService` | service |
| `com.facebook.papaya.fb.instagram.papaya.PapayaExecutionJobService` | service |
| `com.facebook.pushlite.PushLiteFallbackJobService` | service |
| `com.facebook.pushlite.PushLiteGCMJobService` | service |
| `com.facebook.pushlite.PushLiteLollipopJobService` | service |
| `com.facebook.pushlite.tokenprovider.fcm.PushLiteFcmListenerService` | service |
| `com.facebook.pushlite.tokenprovider.fcm.PushLiteFirebaseMessagingService` | service |
| `com.facebook.rtc.notification.instagram.IgRtcNotificationBroadcastReceiver` | receiver |
| `com.facebook.rtc.notification.metaai.MetaAiNotificationForegroundService` | service |
| `com.facebook.rtc.notification.metaai.MetaAiVoiceBroadcastReceiver` | receiver |
| `com.facebook.rtc.notification.NotificationDeletedBroadcastReceiver` | receiver |
| `com.facebook.rtc.notification.RtcMultiCallActionReceiver` | receiver |
| `com.facebook.rtc.notification.RtcNotificationForegroundService` | service |
| `com.facebook.rti.push.service.FbnsService` | service |
| `com.facebook.rti.pushv2.inapp.InappFbnsService` | service |
| `com.facebook.voltron.download.scheduledinstaller.OxygenScheduledInstallerJobService` | service |
| `com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver` | receiver |
| `com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService` | service |
| `com.google.android.gms.analytics.AnalyticsJobService` | service |
| `com.google.firebase.messaging.FirebaseMessagingService` | service |
| `com.instagram.analytics.uploadscheduler.AnalyticsUploadAlarmReceiver` | receiver |
| `com.instagram.api.realtimepeak.LauncherSyncBootReceiver` | receiver |
| `com.instagram.backgroundsync.BackgroundSyncJobService` | service |
| `com.instagram.barcelona.notification.whisper.WhisperPushDeleteReceiver` | receiver |
| `com.instagram.bugreporter.notification.BugReportUploadFailedNotificationDismissedReceiver` | receiver |
| `com.instagram.contacts.ccu.impl.CCUJobService` | service |
| `com.instagram.direct.messagethread.voice.service.AudioMessagePlaybackService` | service |
| `com.instagram.direct.stella.StellaDirectMessagingService` | service |
| `com.instagram.gallery.scanner.MediaScannerJobService` | service |
| `com.instagram.jobscheduler.bgfetch.scheduler.IgBgFetchSchedulerService` | service |
| `com.instagram.jobscheduler.bgfetch.scheduler.IgBgFetchTaskLifeService` | service |
| `com.instagram.jobscheduler.SchedulerNetworkChangeReceiver` | receiver |
| `com.instagram.lazyload.download.ModuleDownloadJobService` | service |
| `com.instagram.metacasper.receiverfeatures.IgPreloadsFbnsClientSignalStaticBroadcastReceiver` | receiver |
| `com.instagram.notifications.actions.ActionHandlerIntentService` | service |
| `com.instagram.notifications.actions.NotificationActionReceiver` | receiver |
| `com.instagram.notifications.local.LocalNotificationAlarmReceiver` | receiver |
| `com.instagram.notifications.local.LocalNotificationBootReceiver` | receiver |
| `com.instagram.notifications.push.ADMMessageHandler$Receiver` | receiver |
| `com.instagram.notifications.push.ADMMessageJobHandler` | service |
| `com.instagram.notifications.push.ADMMessageLegacyHandler` | service |
| `com.instagram.notifications.push.BloksNotificationService` | service |
| `com.instagram.notifications.push.ClearNotificationReceiver` | receiver |
| `com.instagram.notifications.push.fbns.IgPushSdkFbnsReceiverShim` | receiver |
| `com.instagram.notifications.push.fcm.FcmListenerService` | service |
| `com.instagram.notifications.push.fcm.GetFCMTokenAndRegisterWithServerGCMService` | service |
| `com.instagram.notifications.push.fcm.GetFCMTokenAndRegisterWithServerLollipopService` | service |
| `com.instagram.notifications.push.fcm.IgFirebaseMessagingService` | service |
| `com.instagram.notifications.push.fcm.RegisterPushPeriodicJobService` | service |
| `com.instagram.notifications.push.GCMJobService` | service |
| `com.instagram.notifications.push.IgPushRegistrationService` | service |
| `com.instagram.publisher.CopypastaUploadRetryService$RetryAlarmBroadcastReceiver` | receiver |
| `com.instagram.publisher.HeartbeatJobService` | service |
| `com.instagram.publisher.TransactionRevivalJobService` | service |
| `com.instagram.push.FbnsInitBroadcastReceiver` | receiver |
| `com.instagram.push.InstagramAppUpgradeEventReceiver` | receiver |
| `com.instagram.registrationpush.RegistrationPushActionReceiver` | receiver |
| `com.instagram.registrationpush.RegistrationPushAlarmReceiver` | receiver |
| `com.instagram.rtc.signaling.notifications.service.RtcCallActionIntentHandlerService` | service |
| `com.instagram.util.offline.BackgroundPrefetchJobService` | service |
| `com.instagram.zero.dogfooding.notification.IgDogfoodingBroadcastReceiver` | receiver |
| `com.instagram.zero.dogfooding.notification.IgZeroDogfoodingNotificationActionReceiver` | receiver |
| `instagram.features.direct.notifications.impl.internal.DirectNotificationActionReceiver` | receiver |
| `instagram.features.direct.notifications.impl.internal.DirectNotificationActionService` | service |

## Receivers touching boot / connectivity

```
<receiver android:directBootAware="false" android:enabled="false" android:exported="false" android:name="androidx.work.impl.background.systemalarm.RescheduleReceiver"
<receiver android:directBootAware="false" android:enabled="false" android:exported="true" android:name="androidx.profileinstaller.ProfileInstallReceiver"
<receiver android:directBootAware="false" android:enabled="false" android:exported="true" android:name="androidx.work.impl.diagnostics.DiagnosticsReceiver"
<receiver android:directBootAware="false" android:enabled="true" android:exported="false" android:name="androidx.work.impl.utils.ForceStopRunnable$BroadcastReceiver"
<receiver android:enabled="false" android:exported="true" android:name="com.instagram.publisher.CopypastaConnectivityChangeReceiver"
<receiver android:exported="false" android:name="com.facebook.errorreporting.lacrima.detector.broadcast.SecureShutdownBootBroadcastReceiver"
<receiver android:exported="false" android:name="com.instagram.api.realtimepeak.LauncherSyncBootReceiver"
<receiver android:exported="false" android:name="com.instagram.notifications.local.LocalNotificationBootReceiver"
