# Instagram Addiction Research — Android Reverse-Engineering Study

**Date:** 13-11-2026 · **Analyst:** OpenCode (GLM-5.3-Flash) · **Account:** lingadevaru-hp
**Target:** `com.instagram.android` v455.0.0.51.72 (versionCode 386113969), arm64

Empirical reverse-engineering study of **how Instagram's Android app is engineered to be
addictive** — every claim in the report is backed either by evidence extracted from the shipped
APK itself, or by cross-verification against primary sources (Meta engineering blogs, arXiv,
court exhibits from MDL 3047, peer-reviewed research, CJEU case law).

Purpose: **education + personal digital wellness.** Understand the hooks so you can use the
platform without them.

---

## Repository Map

| Path | What it is |
|---|---|
| `report/instagram-addiction-research.md` | **The main report** (10 sections + appendices) |
| `report/EXECUTIVE-SUMMARY.md` | Short digest of findings |
| `evidence/key-evidence.md` | Grep receipts from the APK — every mechanism, re-runnable |
| `evidence/manifest-components.md` | Component inventory decoded from the manifest (patch targets) |
| `evidence/AndroidManifest.xml` | Full decoded manifest (261 KB) |
| `evidence/ig-strings.txt` | All 2.47M string constants from the 32 DEX files (33 MB) |
| `evidence/web-scripts/` | instagram.com web JS chunks captured during the web-verification pass |
| `tools/setup-tools.sh` | Reproducible toolchain installer (apktool 3.0.3 + jadx 1.5.6, no sudo, no AUR) |
| `artifacts/` | **NOT in git** (large + copyright): the XAPK, extracted base APK, full apktool decode, apktool.jar |

## Evidence Chain (verifiable)

| Item | Value |
|---|---|
| Base APK SHA-256 | `8fbecebd8608ff96ea0fb5046f5d2de0d0489081f0b561a65ca1e4b7fd0ca37e` |
| Signer cert | `CN=Kevin Systrom, O=Instagram Inc, L=San Francisco, ST=California, C=US`, valid 2012-02-08 → 2112-01-15 |
| Signer cert SHA-256 | `5f3e50f435583c9ae626302a71f7340044087a7e2c60adacfc254205a993e305` |
| Signature schemes | v2 + v3 + v3.1 (key-rotation lineage self-consistent → authentic Play build) |
| REA evidence IDs | `ev_8e859f09…` (signature), `ev_276f5392…` (signers), `ev_95224163…` (resource decode), `ev_eeeee32c…` / `ev_cd793704…` / `ev_5f193f69…` (web pass) |

## Headline Findings

1. **Triple-layer push re-engagement** — FCM + Meta's own FBNS channel + locally scheduled
   AlarmManager notifications that are re-armed on every phone boot (`LocalNotificationBootReceiver`
   + `RECEIVE_BOOT_COMPLETED`). AYMT ("Are You Missing This?") tips are sent only where an uplift
   model predicts the notification *changes your behavior*. Independent science: a notification
   multiplies app-open probability **3.5× within the hour** (Bell et al., JMIR 2023).
2. **On-device usage surveillance** — `session_history` + `module_session` SQLite tables log every
   session to the millisecond, *including background time*; 7-day usage buckets gate experiments on
   how hooked you already are.
3. **The badge is manufactured anticipation** — `optimistic_launcher_badge_count_unseen_activities`.
4. **No stopping cues** — Reels pre-warms the next video before you swipe; autoplay is
   server-configured (`clips/autoplay_configs/`).
5. **The ranking ML is server-side** — the app is a delivery shell; the value model (weighted
   P(like)/P(save)/P(send), Bayesian-optimized for sessions/DAU) runs on Meta's servers. You can
   patch out the client hooks, not the feed.

See `report/instagram-addiction-research.md` for the full analysis, legality of personal-use
patching (EU CJEU C-13/20, US DMCA §1201(f), India §52), the step-by-step patch pipeline, and a
ranked no-patch defense playbook.

## Reproducing This Study

```bash
# 1. toolchain (no sudo)
./tools/setup-tools.sh

# 2. get the APK — best from your own device (guarantees your exact build):
adb shell pm path com.instagram.android   # → /data/app/.../base.apk
adb pull <that path> artifacts/

# 3. verify authenticity before trusting it (must match the hashes above):
androguard sign artifacts/base.apk

# 4. decode + mine
apktool d --no-src -f -o artifacts/apk-decode artifacts/base.apk
unzip -o artifacts/base.apk "classes*.dex" -d dex/
strings -a dex/*.dex > evidence/ig-strings.txt
```

## What Is NOT in This Repo (and why)

- `artifacts/instagram.xapk`, `artifacts/ig-xapk/` (155 MB + 148 MB binaries): exceeds GitHub's
  100 MB per-file limit, and **re-uploading the APK would be redistribution of Meta's copyrighted
  binary** — the exact thing this research says not to do. Re-download per the instructions above.
- `artifacts/apk-decode/` (317 MB full resource decode, incl. Meta's compiled assets) — kept
  locally only; it is the working directory for any future smali patching.
- `artifacts/apktool.jar` — re-obtain via `tools/setup-tools.sh`.

**Note on the rest of the repo:** evidence text files (strings, manifest XML, component names)
are published here as research documentation, consistent with how APK RE writeups are normally
shared. Still, this repository is **private** by default; make it public only if you accept that.

## Legality Reminder (not legal advice)

- ✅ Personal-use analysis and patching: supported by CJEU C-13/20 (EU), DMCA §1201(f) (US),
  §52 (India).
- ❌ Distributing APKs or patched builds: copyright infringement — do not add binaries here, do not
  share patched builds.
- ⚠️ Re-signed builds break Play Integrity and never auto-update; ToS breach is an account-level
  risk.
