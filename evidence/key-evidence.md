# Key Evidence Receipts — Empirical Findings (13-11-2026)

Raw string-constant mining from the 32 DEX files of the verified base APK.
All greps below re-runnable against `evidence/ig-strings.txt` (2.47M strings, verbatim from `strings -a classes*.dex`).

Regenerate the corpus:

```bash
unzip -o artifacts/ig-xapk/com.instagram.android.apk "classes*.dex" -d dex/
strings -a dex/*.dex > evidence/ig-strings.txt
```

## 1. Push re-engagement (3 redundant delivery layers)

```
IgFcmTokenRegistrar              classes21.dex classes2.dex classes3.dex classes.dex
GCMJobService                    classes29.dex classes5.dex
com.facebook.rti.push.service.FbnsService / InappFbnsService      (manifest — Meta's own push channel)
com.instagram.notifications.local.LocalNotificationAlarmReceiver (manifest)
com.instagram.notifications.local.LocalNotificationBootReceiver  (manifest + RECEIVE_BOOT_COMPLETED)
register_push_token_on_session_start
push_token_registration_request_sent
notif deduped in PushNotificationManager using pushId
```

Token registration is a periodic JobScheduler job + alarm (`RegistrationPushAlarmReceiver`).

## 2. AYMT re-engagement notification engine ("Are You Missing This?")

```
aymt_notif_type
aymt_channel_id
ImmutablePandoAYMTTip / ImmutablePandoAYMTTipAction
AYMT_LWI_YESTERDAY_SUMMARY_TIP_NOTIF
NME_IG_POST_POST_CREATION_NOTIF_AYMT
clips_daily_digest / story_daily_digest
com.bloks.www.caa.login.aymh.screen_query_bundled_payload.json  (bundled BLOKS payload in assets/)
```

## 3. On-device usage tracking (SQLite schemas, verbatim)

```sql
CREATE TABLE IF NOT EXISTS `session_history` (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  session_id TEXT NOT NULL,
  session_start_time INTEGER NOT NULL,
  session_end_time INTEGER NOT NULL,
  session_length_ms INTEGER NOT NULL,
  background_time_spent_ms INTEGER NOT NULL,
  background_recency INTEGER NOT NULL,
  prev_session_background_timestamp INTEGER NOT NULL,
  created_at INTEGER NOT NULL)

CREATE TABLE IF NOT EXISTS `module_session` (
  ... module_name TEXT NOT NULL, time_spent_ms INTEGER NOT NULL,
  last_visible_timestamp INTEGER NOT NULL, vpvd_impressions INTEGER NOT NULL, ...)
```

Usage-bucket config keys gate experiments on cumulative addiction level:
`app_start_time_spent_l60_min` → `_l120` → `_l480` → `_l720` → `_l1440` → `_l2880` → `_l7200` → `_l10080` (7-day bucket).
Time-spent upload: `time_spent_bit_array` GraphQL mutation.

## 4. Launcher badge engine (manufactured anticipation)

```
optimistic_launcher_badge_count_unseen_activities
app_badge_count / app_icon_badge_count / app_icon_badge_count_direct
direct_inbox_badge_count_sequence_id            (sequence-versioned consistency)
badge_count_breakdown / badge_count_map / badge_count_source
UPDATE_APP_BADGE (manifest permission)
```

## 5. No stopping cues: Reels autoplay + prefetch

```
clips/autoplay_configs/        (server-driven autoplay config)
autoplay_threshold / autoplay_eligible / autoplay_video_playback_requested
ReelsViewerVideoPreWarmerImpl.prefetchCoverImage
ClipsPluginImpl_prefetchClips
is_first_media_from_cache_content_video_with_autoplay
is_first_media_from_network_content_video_with_autoplay
```

The next video is pre-warmed before you swipe — zero delay between rewards.

## 6. Social grip / investment loops

```
streak_count
UnseenLikesLocalNotificationBinder       (locally scheduled "unseen likes" pull-backs)
CREATE TABLE IF NOT EXISTS `suggested_users` (`user_id` TEXT NOT NULL,
  `impression_timestamps` TEXT NOT NULL, `last_timestamp` TEXT NOT NULL, PRIMARY KEY(`user_id`))
direct_thread_unseen_message_impression / group_msgs_unseen / chain_unseen_reels
auto_reshare_to_story_row_new_badge_count_for_feed / _for_clips
```

## 7. Background machinery (telemetry + content pre-loading)

```
IgBgFetchJob / BackgroundSyncJobService / BackgroundPrefetchJobService
AnalyticsJobService — "processed last dispatch request"
FOREGROUND_SERVICE_{CAMERA,MICROPHONE,LOCATION,MEDIA_PLAYBACK,DATA_SYNC,...} (manifest)
WAKE_LOCK, RECEIVE_BOOT_COMPLETED, POST_NOTIFICATIONS (manifest)
```

## 8. Well-being layer exists — on Meta's terms

```
guardian_daily_limit_blocking_screen / at_or_over_daily_limit
daily_limit_near_reminder_notification_type     (the limit reminder is itself a notification)
current_client_sleep_mode_reminder_implementation
instagram://quiet_mode?entry_point={entry_point}
ig_ts_entry_point_take_a_break_first_time_blocking
```

## 9. Key conclusion — ranking is server-side

No feed-ranking ML exists in the APK. The client holds only plumbing: config keys
(`autoplay_threshold`, `clips/autoplay_configs/`), experiment gates (`app_start_time_spent_l*`),
bundled BLOKS server-UI payloads (`assets/*_bundled_payload.json`, `app_modules.json`).
Patching removes client hooks (push/badges/autoplay/telemetry); the value model runs on Meta's servers.
