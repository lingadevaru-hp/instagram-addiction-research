#!/bin/sh
# Reproducible toolchain for this research — no sudo, no AUR, official upstream releases only.
# Usage: ./setup-tools.sh  (installs into ~/.local)
set -e

BIN="$HOME/.local/bin"
SHARE="$HOME/.local/share"
mkdir -p "$BIN" "$SHARE"

# --- apktool 3.0.3 (official release jar) ---
if [ ! -f "$SHARE/apktool.jar" ]; then
  curl -sL -o "$SHARE/apktool.jar" \
    https://github.com/iBotPeaches/Apktool/releases/download/v3.0.3/apktool_3.0.3.jar
fi
printf '#!/bin/sh\nexec java -jar %s/apktool.jar "$@"\n' "$SHARE" > "$BIN/apktool"
chmod +x "$BIN/apktool"

# --- jadx 1.5.6 (Java decompiler, read-only reference) ---
if [ ! -d "$SHARE/jadx-1.5.6" ]; then
  curl -sL -o /tmp/jadx.zip https://github.com/skylot/jadx/releases/download/v1.5.6/jadx-1.5.6.zip
  unzip -q /tmp/jadx.zip -d "$SHARE/jadx-1.5.6"
  rm /tmp/jadx.zip
  chmod +x "$SHARE"/jadx-1.5.6/bin/jadx
  ln -sf "$SHARE/jadx-1.5.6/bin/jadx" "$BIN/jadx"
fi

# --- androguard (APK certificate inspection; python) ---
python3 -c "import androguard" 2>/dev/null || \
  pip install --user --break-system-packages androguard

echo "installed:"
apktool --version
jadx --version 2>/dev/null | head -1
