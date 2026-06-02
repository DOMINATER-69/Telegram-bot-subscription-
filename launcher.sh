#!/bin/bash

CONFIG_FILE=".env_secure"
evm="manager.enc"
evmk="Error_occurred_200_OK" 


if [ ! -f "$evm" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "❌ [CRITICAL ERROR] Encrypted engine file '$evm' missing!"
    echo "💡 Please ensure the python file is in this folder."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi


setup_new_bot() {
    echo "📝 [SETUP WIZARD] Enter your Telegram Bot credentials:"
    echo "-----------------------------------------------------"
    
    while true; do
        read -p "🤖 Enter Telegram BOT TOKEN: " user_token
        user_token=$(echo "$user_token" | tr -d ' ')
        if [ -z "$user_token" ]; then echo "⚠️ Error: Token cannot be empty!"
        else break; fi
    done

    while true; do
        read -p "👑 Enter ADMIN CHAT ID: " user_admin_id
        user_admin_id=$(echo "$user_admin_id" | tr -d ' ')
        if [[ ! "$user_admin_id" =~ ^[0-9]+$ ]]; then echo "⚠️ Error: Invalid Chat ID! Numbers only."
        else break; fi
    done

    while true; do
        read -p "👤 Enter OWNER TELEGRAM HANDLE: " user_owner
        user_owner=$(echo "$user_owner" | tr -d ' ')
        if [ -z "$user_owner" ]; then echo "⚠️ Error: Owner handle cannot be empty!"
        else
            [[ "$user_owner" != @* ]] && user_owner="@$user_owner"
            break
        fi
    done

    echo "Writing dynamic tokens into local containers..."
    echo "BOT_TOKEN=\"$user_token\"" > "$CONFIG_FILE"
    echo "ADMIN_ID=\"$user_admin_id\"" >> "$CONFIG_FILE"
    echo "OWNER_NAME=\"$user_owner\"" >> "$CONFIG_FILE"
    
    chmod 600 "$CONFIG_FILE"
    echo "✅ Configuration saved successfully!"
    echo "-----------------------------------------------------"
}


run_bot_engine() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "⚠️ No configuration found! Please run Setup first."
        echo "-----------------------------------------------------"
        return
    fi

    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🔄 Injecting network credentials into RAM..."
    source "$CONFIG_FILE"

    export BOT_TOKEN
    export ADMIN_ID
    export OWNER_NAME

    echo "🚀 ...........Starting the bot..........."
    echo "📊 Logging active. Press [Ctrl + C] to return to Main Menu."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    pyth="
import os, sys
def dd(data, key):
    k = key.encode('utf-8')
    return bytes([b ^ k[i % len(k)] for i, b in enumerate(data)])
with open('$evm', 'rb') as f:
    enc_data = f.read()
asc = dd(enc_data, '$evmk').decode('utf-8')
exec(asc, {'__name__': '__main__'})
"

    
    while true; do
        python3 -c "$pyth"
        exit_code=$?
        
        if [ $exit_code -eq 0 ]; then
            echo "💡 Bot engine stopped gracefully."
            break
        else
            echo "⚠️ Engine crashed (Code: $exit_code). Auto-restarting in 5 seconds..."
            sleep 5
            echo "🔄 Re-executing system hooks..."
        fi
    done
    read -p "Press [Enter] to return to Menu..."
}


while true; do
    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "👑  PREMIUM LICENSING SYSTEM - INTERFACE  "
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if [ -f "$CONFIG_FILE" ]; then
        echo "📊 STATUS: 🟢 Connected to a Bot Configuration Container"
    else
        echo "📊 STATUS: 🔴 Unconfigured (Setup Required)"
    fi
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "1) 🚀 Run Bot Engine"
    echo "2) 📝 Setup New Bot Connection"
    echo "3) 🔄 Reset Configuration (Wipe & Connect Another Bot)"
    echo "4) ❌ Exit Launcher"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "👉 Choose an option [1-4]: " choice
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    case $choice in
        1) run_bot_engine ;;
        2)
            if [ -f "$CONFIG_FILE" ]; then
                read -p "⚠️ Overwrite existing config? (y/n): " confirm
                [[ "$confirm" == [yY] ]] && setup_new_bot
            else
                setup_new_bot
            fi
            read -p "Press [Enter] to continue..."
            ;;
        3)
            if [ -f "$CONFIG_FILE" ]; then
                read -p "❗ Are you sure you want to reset? (y/n): " confirm
                if [[ "$confirm" == [yY] ]]; then
                    rm -f "$CONFIG_FILE"
                    echo "🗑️ Old configuration purged!"
                    setup_new_bot
                fi
            else
                echo "❌ No configuration file found to reset."
            fi
            read -p "Press [Enter] to continue..."
            ;;
        4)
            echo "👋 Exiting Launcher System. System secured."
            exit 0
            ;;
        *)
            echo "❌ Invalid Choice!"
            sleep 2
            ;;
    esac
done
