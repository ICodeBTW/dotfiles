#!/usr/bin/env python


import json
import pytz
import calendar
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
        year = datetime.now().year
        month = datetime.now().month
        curr_year = datetime.now().year
        curr_month = datetime.now().month
        curr_day = datetime.now().day

        # ANSI escape sequences for colors
        colored_day = "\033[92m" + str(curr_day) + "\033[0m"

        calendar_output = calendar.month(curr_year, curr_month)

        # finds occurrences of today's digits inside the year string
        # count_day_in_year = str(curr_year).count(str(curr_day))
        #
        # changes today's digits color only in the right place
        # if str(curr_day) in str(curr_year):
        #     # paint day within year (first occurrence(s)) and one more occurrence (the curr. day)
        # highlighted_day = calendar_output.replace(
        #     str(curr_day), colored_day, count_day_in_year + 1
        # )
        # # remove color of the first occurrence(s) in the year
        # highlighted_day = highlighted_day.replace("\033[92m", "", count_day_in_year)
        # highlighted_day = highlighted_day.replace("\033[0m", "", count_day_in_year)
        # else:
        #     highlighted_day = calendar_output.replace(str(curr_day), colored_day, 1)

        # self.calendar = highlighted_day
        #
        self.calendar = calendar_output

    def json_dump(self):
        json_data = {}
        json_data["text"] = datetime.now().strftime(" %I:%M %p   %a, %b %e")
        timeString = "\n".join(self.times)
        json_data[
            "tooltip"
        ] = f"{self.calendar}\n-----------------------\nTimezones\n{timeString}"
        print(json.dumps(json_data))


if __name__ == "__main__":
    timezone = TimeZones()
    timezone.json_dump()
