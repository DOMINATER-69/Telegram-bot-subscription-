# 🚀 Telegram Premium Licensing Bot

A powerful Telegram bot for managing premium subscriptions, user access, license durations, and admin controls.

Built for Telegram communities that require a secure and flexible licensing system.

---

# ✨ Features

## 👤 User Management

- Add new users instantly
- Remove users at any time
- Extend subscription validity
- Track active subscriptions
- Automatic expiry handling

## 📅 License System

- Minutes, hours, days, and custom duration support
- Real-time expiry calculation
- Automatic access control
- Flexible subscription management

## 🛡️ Admin Controls

- Secure admin-only commands
- User activation system
- Subscription extension support
- User removal functionality

## 📊 Statistics

- View total users
- Monitor active subscriptions
- Database overview
- User activity tracking

---

# ⚙️ Installation

## Clone Repository

```bash
pkg update && pkg upgrade

pkg install git python

git clone https://github.com/DOMINATER-69/Telegram-bot-subscription-.git

cd Telegram-bot-subscription-
```

## Install Dependencies

```bash
pip install -r requirements.txt
```
---
###run the command 
```bash
chmod +x launcher.sh
./launcher.sh
```
## Configure Bot

Open the source code and replace the bot token:

```python
BOT_TOKEN = "YOUR_BOT_TOKEN"
```

Get your token from BotFather.
---

# 📌 Available Commands

## User Commands

| Command | Description |
|----------|-------------|
| `/start` | Start the bot |
| `/status` | Check subscription status |
| `/help` | Display help information |

## Admin Commands

| Command | Description |
|----------|-------------|
| `/add <user_id> <duration>` | Add a new user |
| `/extend <user_id> <duration>` | Extend user validity |
| `/remove <user_id>` | Remove a user |
| `/allusers` | View all registered users |

---

# 🖥️ Example Usage

## Activate User For 45 Minutes

```bash
/add 123456789 45m
```

Result:

```text
User Activated Successfully
Duration: 45 Minutes
```

---

## Activate User For 12 Hours

```bash
/add 123456789 12h
```

Result:

```text
User Activated Successfully
Duration: 12 Hours
```

---

## Extend Subscription

```bash
/extend 123456789 7d
```

Result:

```text
Subscription Extended Successfully
Duration: 7 Days
```

---

## Remove User

```bash
/remove 123456789
```

Result:

```text
User Removed Successfully
```

---

# 🧩 Technologies Used

- Python 3
- python-telegram-bot
- JSON Database
- Async Programming
- Telegram Bot API

---

# 🔒 Security

- Admin-only access control
- Subscription validation
- User authentication checks
- Secure license management

---

# 🎯 Future Updates

- Broadcast Messaging
- Multi Admin Support
- Referral System
- Payment Integration
- Auto Backup System
- Analytics Dashboard
- Web Management Panel

---

# ⚠️ Legal Disclaimer

This project is intended for educational and authorized use only.
Users are responsible for complying with all applicable laws and platform policies.

---

# 👨‍💻 Developed & Maintained By

**DOMINATER69**

GitHub:
https://github.com/DOMINATER-69
