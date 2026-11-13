# Executive Summary

**One-paragraph answer:** Instagram's addictiveness is a closed feedback loop built from four
engineered systems — (1) a **ranking algorithm** that maximizes predicted engagement, (2) **ML
models** predicting, per item, the probability you'll like/save/share/watch, combined into a
single "value" score, (3) **variable-reward UX** (infinite scroll, autoplay, streaks, unseen
counters) that removes every natural stopping point, and (4) a **notification system** — FCM +
Meta's own FBNS channel + locally scheduled alarms — tuned by uplift models so each push is sent
only when it measurably increases your session probability. All four were verified inside the
shipped APK and cross-verified against Meta engineering blogs, arXiv, court exhibits, and
peer-reviewed research.

## The strongest numbers

| Fact | Source |
|---|---|
| A notification multiplies app-open probability **3.5×** within the next hour | Bell et al., JMIR mHealth 2023 (micro-randomized trial) |
| **35%** of teen late-night sessions began ≤5 min after a push | MDL 3047 court exhibits |
| Autoplay drives **23%** of teen late-night time; recommended content 23%; notifications 21% | MDL 3047 |
| Internal goals moved **40 → 46 min/day** of teen usage | MDL 3047 |
| Reels + Direct = **56%** of teen late-night time | MDL 3047 |

## What the APK itself proves (selected)

- `session_history` / `module_session` SQLite schemas — millisecond usage tracking incl. background time
- `aymt_notif_type`, `aymt_channel_id`, `ImmutablePandoAYMTTip` — the AYMT re-engagement engine
- `LocalNotificationAlarmReceiver` + `LocalNotificationBootReceiver` — local pull-backs survive reboots
- `optimistic_launcher_badge_count_unseen_activities` — the badge engine
- `ReelsViewerVideoPreWarmerImpl.prefetchCoverImage`, `clips/autoplay_configs/` — no stopping cues
- `streak_count`, `suggested_users` DB with impression timestamps — social/investment loops
- No ranking ML on device — **the app is a delivery shell; the algorithm is server-side**

## Practical takeaways

1. **Kill notifications per-channel at the OS level + turn off the badge** — 30 seconds, defeats
   the entire pull-back system without patching.
2. Grayscale + Digital Wellbeing timer + in-app Sleep mode / daily limit.
3. **Most stable end-state for productivity:** uninstall the app, use instagram.com web-only.
4. Personal-use patching is legal-ish (EU CJEU C-13/20, US DMCA §1201(f), India §52), feasible,
   and fragile — it kills client hooks but not the server-side ranking.

Full detail: `instagram-addiction-research.md` in this folder.
