
#!/usr/bin/env python


import json
import pytz
from datetime import datetime


# TODO: Add more countries and remove the timezone same as local
class TimeZones:
    def __init__(self):
        # Get different timezones
        timezones = {
            "India": "Asia/Kolkata",
            "UK/London": "Europe/London",
            "Canada/Halifax": "America/Halifax",
            "America/Los Angeles": "America/Los_Angeles",
            "Japan": "Asia/Tokyo",
        }
        # self.india_time = india.strftime("%H:%M %p")
        pytz_times = [
            datetime.now(pytz.timezone(timezone)) for timezone in timezones.values()
        ]
        self.times = [
            f'{country} : {timezone.strftime(" %I:%M %p   %a, %b %e")}'
            for timezone, country in zip(pytz_times, timezones.keys())
        ]

    def json_dump(self):
        json_data = {}
        json_data["text"] = datetime.now().strftime(" %I:%M %p   %a, %b %e")
        timeString = "\n".join(self.times)
        json_data[
            "tooltip"
        ] = f"Timezones\n{timeString}"
        print(json.dumps(json_data))


if __name__ == "__main__":
    timezone = TimeZones()
    timezone.json_dump()
