# guys this is fully written by AI (

#!/system/bin/sh

# 1. Check for Magisk environment
if [ -d "/data/adb/magisk" ] || [ -f "/data/adb/magisk/magisk" ]; then
    echo "[*] Magisk environment detected."
    IS_MAGISK=true
else
    echo "[+]  Magisk isn't installed on this device."
    IS_MAGISK=false
fi

# 2. Check for KsuWebUI (Standalone App)
# The package name for the KsuWebUI standalone implementation
KSU_WEBUI_PKG="io.github.adivenx.ksuwebui"

if [[ ! pm list packages | grep -q "$KSU_WEBUI_PKG" && "$IS_MAGISK" = true ]]; then
        echo "--------------------------------------------------------"
        echo "Magisk detected, but you are missing the WebUI manager."
        echo "Without it, you cannot configure module settings."
        echo "--------------------------------------------------------"
        echo -n "Would you like to open the download page? (y/n): "
        read choice
        if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
            am start -a android.intent.action.VIEW -d "https://github.com/adivenx/KsuWebUI/releases"
        fi
fi
