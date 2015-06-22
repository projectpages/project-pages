import flickrapi
import json

#parameters
api_key = '10269d23e23ee66e01e3f5ed5adb5b93'
api_secret = 'a54c9aed907f84e8'
user_id = '133344343@N08'
photoset_id = '72157654544890436'
img_size = 't'
img_file_format = 'jpg'
file_name = 'data3d'

#helper function to generate the json file
def generate3dJson(api_key, api_secret, user_id, photoset_id, img_size, img_file_format, first_pc_list, second_pc_list, third_pc_list, img_title_list, file_name):
	#configure api and get photos
	flickr = flickrapi.FlickrAPI(api_key, api_secret, format='parsed-json')
	photos = flickr.photosets.getPhotos(api_key=api_key, photoset_id=photoset_id, user_id=user_id)
	#create img title, img url dict
	url_dict = {}
	for item in photos['photoset']['photo']:
		url = 'http://farm'+str(item['farm'])+'.staticflickr.com/'+str(item['server'])+'/'+str(item['id'])+'_'+item['secret']+'_'+img_size+'.'+img_file_format
		url_dict.update({item['title']: url})
	#data list to output as json file
	dt_list = []
	keys = ['x', 'y', 'z', 'title']
	for item in zip(first_pc_list, second_pc_list, third_pc_list, img_title_list):
		item_dict = dict(zip(keys, item))
		item_dict.update({'url': url_dict[item_dict['title']]})
		dt_list.append(item_dict)
	#dump json file
	with open('../json/'+file_name+'.json', 'w') as output:
		json.dump(dt_list, output)