import json
import time
import requests

LOG_FILE = "/var/log/suricata/eve.json"

BOT_TOKEN= "your token"
CHAT_ID = "1281807340"

def send_telegram(message):
    url = f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage"
    data = {
        "chat_id": CHAT_ID,
        "text": message
    }
    requests.post(url, data=data)

def follow_log():
    with open(LOG_FILE, "r") as f:
        f.seek(0, 2)

        while True:
            line = f.readline()
            if not line:
                time.sleep(0.5)
                continue

            try:
                data = json.loads(line)

                if data.get("event_type") == "alert":
                    msg = data["alert"]["signature"]
                    src = data.get("src_ip")
                    dest = data.get("dest_ip")

                    alert = f"""
🚨 SURICATA ALERT 🚨
Message: {msg}
Source: {src}
Destination: {dest}
"""

                    print(alert)
                    send_telegram(alert)

            except:
                pass

follow_log()
