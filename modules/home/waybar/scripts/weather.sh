#!/bin/bash

get_icon() {
  case $1 in
  # Weather icons using Nerd Font symbols
  01d) icon="󰖙" ;;  # Clear day
  01n) icon="󰖔" ;;  # Clear night
  02d) icon="󰖕" ;;  # Partly cloudy day
  02n) icon="󰼱" ;;  # Partly cloudy night
  03*) icon="󰖐" ;;  # Cloudy
  04*) icon="󰖐" ;;  # Overcast
  09d) icon="󰖗" ;;  # Shower rain day
  09n) icon="󰖗" ;;  # Shower rain night
  10d) icon="󰖖" ;;  # Rain day
  10n) icon="󰖖" ;;  # Rain night
  11d) icon="󰖓" ;;  # Thunderstorm day
  11n) icon="󰖓" ;;  # Thunderstorm night
  13d) icon="󰖘" ;;  # Snow day
  13n) icon="󰖘" ;;  # Snow night
  50d) icon="󰖑" ;;  # Mist day
  50n) icon="󰖑" ;;  # Mist night
  *) icon="󰼯" ;;    # Default/unknown
  esac
  echo $icon
}

# OpenWeatherMap API key - replace with your own
KEY="xxx"
CITY="Sydney"
UNITS="metric"
SYMBOL="°C"
 
API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
  if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
    CITY_PARAM="id=$CITY"
  else
    CITY_PARAM="q=$CITY"
  fi

  weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
  location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

  if [ -n "$location" ]; then
    location_lat="$(echo "$location" | jq '.location.lat')"
    location_lon="$(echo "$location" | jq '.location.lng')"

    weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
  fi
fi

if [ -n "$weather" ]; then
  weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
  weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

  echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
fi
