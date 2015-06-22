import numpy as np
from generate2dJson import generate2dJson

#arguments
api_key = '10269d23e23ee66e01e3f5ed5adb5b93'
api_secret = 'a54c9aed907f84e8'
user_id = '133344343@N08'
photoset_id = '72157654544890436'
img_size = 't'
img_file_format = 'jpg'
file_name = 'data2d'

# generate random data points ranging from 0 to 10
x = np.random.random(100) * 10
y = np.random.random(100) * 10
# image titles must match those on flickr
img_title_list = []
for i in xrange(1,101):
	title = 'img' + str(i)
	img_title_list.append(title)

generate2dJson(api_key, api_secret, user_id, photoset_id, img_size, img_file_format, x, y, img_title_list, file_name)