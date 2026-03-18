---
name: configure-notifications
description: Configura notificações para Discord, Telegram, Slack
version: 1.0.0
---

# Configure Notifications Skill

## Purpose
Configure notifications for session events. Get alerts when sessions complete, fail, or need attention.

## Supported Platforms
- Discord (webhook)
- Telegram (bot)
- Slack (webhook)
- File (local log)

## Invocation

### Command
```
/omk-configure-notifications telegram
/omk-configure-notifications discord
/omk-configure-notifications slack
```

### Skill
```
$configure-notifications telegram --enable --token <bot_token> --chat <chat_id>
$configure-notifications discord --enable --webhook <url>
$configure-notifications slack --enable --webhook <url>
```

## Configuration

### Telegram
```bash
$configure-notifications telegram \
  --enable \
  --token "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11" \
  --chat "-1001234567890" \
  --tag-list "@alice,bob"
```

### Discord
```bash
$configure-notifications discord \
  --enable \
  --webhook "https://discord.com/api/webhooks/..." \
  --tag-list "@here,@alice,role:123456"
```

### Slack
```bash
$configure-notifications slack \
  --enable \
  --webhook "https://hooks.slack.com/services/..." \
  --tag-list "<!here>,<@U123456>"
```

## Events

Notifications sent on:

| Event | Description |
|-------|-------------|
| `session-start` | Session begins |
| `session-complete` | Session finished successfully |
| `session-fail` | Session failed |
| `stop` | Session stopping |

## Message Format

### Discord
```markdown
**OMK Session Update**

Project: {projectName}
Session: {sessionId}
Status: ✅ Complete / ❌ Failed

Duration: {duration}
Agents used: {count}
```

### Telegram
```
🔔 OMK Update

Project: {projectName}
Status: {status}
Time: {duration}
```

## Tag Behavior

| Platform | Tag Format |
|----------|------------|
| Telegram | `alice` → `@alice` |
| Discord | `@here`, `@everyone`, `role:<id>` |
| Slack | `<@USER_ID>`, `<!here>`, `<!channel>` |

## Update Configuration

Add/remove tags:
```
$configure-notifications telegram --add-tag charlie
$configure-notifications discord --remove-tag @here
$configure-notifications slack --clear-tags
```

## Disable

```
$configure-notifications telegram --disable
```

## Configuration File

`~/.kimi/omk_config.notifications.json`:
```json
{
  "telegram": {
    "enabled": true,
    "token": "...",
    "chat": "...",
    "tagList": ["@alice"]
  },
  "discord": {
    "enabled": false,
    "webhook": "..."
  }
}
```

## Example

```
User: configure-notifications discord

Kimi: Configuring Discord notifications...
      
      ? Webhook URL: https://discord.com/api/webhooks/...
      ? Tag list: @here,@dev-team
      
      ✓ Configuration saved
      
      Test notification sent!
      
      You'll receive notifications when:
      - Sessions complete
      - Sessions fail
      - Errors occur
```
