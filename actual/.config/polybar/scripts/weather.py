import os
import requests
import json
offset = -273.15

def icon(icon_code):
    # Icons for weather-icons
    switcher = {
            "01d": "",
            "01n": "",
            "02d": "",
            "02n": "",
            "09d": "",
            "09n": "",
            "10d": "",
            "10n": "",
            "11d": "",
            "11n": "",
            "13d": "",
            "13n": "",
            "50d": "",
            "50n": ""
    }
    if icon_code[:2] == "03":
        return("")
    elif icon_code[:2] == "04":
        return("")
    else:
        return(switcher.get(icon_code, ""))

# openweather api key
api_key = "a69daaa6a0362f8b1692b6c737e5d151"
lat = os.getenv("LAT")
lon = os.getenv("LON")
url = "https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=" + api_key
request = requests.get(url)
if request.status_code == 200:
    data=json.loads(request.text)
    print(icon(data["weather"][0]["icon"]) + " " +
            data["weather"][0]["main"] + ", " +
            str(int(data["main"]["temp"] + offset)) +
            "°")
else:
    print("error: " + str(request.status_code))
