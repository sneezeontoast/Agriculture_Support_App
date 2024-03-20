# import numpy as np

rain = {
	0: 0,
	200: 15,
	400: 30,
	600: 45,
	800: 60,
	1000: 75,
	1200: 100
}

cloud = {
	0: 0,
	15: 15,
	30: 30,
	45: 45,
	60: 60,
	75: 75,
	100: 100
}

sun = {
	0: 0,
	15: 15,
	30: 30,
	45: 45,
	60: 60,
	75: 75,
	100: 100
}

wind = {
	0: 0,
	15: 15,
	30: 30,
	45: 45,
	60: 60,
	75: 75,
	100: 100

}

# good_bad_thresholds= {
# 	0: 'no ',
# 	20: 'very little ',
# 	40: 'little ',
# 	50: 'moderate ',
#
# }
good_bad_thresholds = {
	0: 'no ',
	25: 'low ',
	50: 'moderate ',
	75: 'high ',
	100: 'very high '
}

other_good_bad_thresholds = {
	0: 'not ',
	25: 'slightly ',
	50: 'moderately ',
	75: 'quite ',
	100: 'really '
}

weather_text_convert = {
	0: 'rainy ',
	1: 'cloudy ',
	2: 'hot ',
	3: 'windy '
}

def find_good_or_bad(percent, l):
	lst = [0, 25, 50, 75, 100]
	print("p ", percent)
	percent = lst[min(range(len(lst)), key=lambda i: abs(lst[i]-percent))]
	return l.get(percent, "nothing")


def find_nearest_value(value, data):
	nearest_value = max(k for k in data if k <= value) 
	return data[nearest_value]


def find_weather(weather_mesurement):
	best_weathers = 0
	top_weather = ('temperature ', weather_mesurement[2])
	dose_not_work = True
	thresh = 90
	rainy = ('rainy ', weather_mesurement[0])
	cloudy = ('cloudy ', weather_mesurement[1])
	sunny = ('sunny ', weather_mesurement[2])
	windy = ('windy ', weather_mesurement[3])

	while dose_not_work:
		for i in range(3):
			weather_text = weather_text_convert.get(i, 'nothing')
			if weather_mesurement[i] >= thresh:
				top_weather = weather_text

		if weather_mesurement[0] + weather_mesurement[1] >= thresh:
			best_weathers = (rainy, cloudy)
			dose_not_work = False

		if weather_mesurement[0] + weather_mesurement[2] >= thresh:
			best_weathers = (rainy, sunny)
			dose_not_work = False

		if weather_mesurement[0] + weather_mesurement[3] >= thresh:
			best_weathers = (rainy, windy)
			dose_not_work = False

		if weather_mesurement[1] + weather_mesurement[2] >= thresh:
			best_weathers = (cloudy, sunny)
			dose_not_work = False

		if weather_mesurement[1] + weather_mesurement[3] >= thresh:
			best_weathers = (cloudy, sunny)
			dose_not_work = False

		if weather_mesurement[2] + weather_mesurement[3] >= thresh:
			best_weathers = (sunny, windy)
			dose_not_work = False

		thresh -= 10

	weathers = (('cloud cover ', weather_mesurement[1]), ('temperature ', weather_mesurement[2]), ('rainfall ', weather_mesurement[0]), ('wind speed ', weather_mesurement[3]))
	print("weathers[0]: ", weathers[0])
	print("best_weathers[0][1], best_weathers[1][1]: ", best_weathers[0][1], best_weathers[1][1])
	quick_description = (find_good_or_bad(best_weathers[0][1], other_good_bad_thresholds)
						 + best_weathers[0][0] + "and " +
						 find_good_or_bad(best_weathers[1][1], other_good_bad_thresholds)
						 + best_weathers[1][0])

	long_description = (find_good_or_bad(weathers[0][1], good_bad_thresholds) +
						weathers[0][0] + "with " + find_good_or_bad(weathers[1][1], good_bad_thresholds) +
						weathers[1][0] + "and " + find_good_or_bad(weathers[2][1], good_bad_thresholds)
						+ weathers[2][0]
						)

	print("quick description ", quick_description)
	print("long description: ", long_description)
	print("top weather: ", top_weather)
	# print("long description: ", find_good_or_bad(weathers[0][1]), weathers[0][0], "and", find_good_or_bad(weathers[1][1]), weathers[1][0], "and", find_good_or_bad(weathers[2][1]), weathers[2][0]




value = (2000, 2000, 2000, 2000)
	# input("what data: ")
	# (240, 67,50)

weather_mesurement = (find_nearest_value(value[0], rain), find_nearest_value(value[1], cloud), find_nearest_value(value[2], sun), find_nearest_value(value[3], wind))
print(weather_mesurement)
find_weather(weather_mesurement)

