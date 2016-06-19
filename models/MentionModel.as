package models
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class MentionModel extends EventDispatcher
	{
		public var id:String;
		public var text:String;
		public var screenName:String

		public function MentionModel(data:Object = null)
		{
			if (data)
			{
				fillModel(data);
			}
		}

		public function fillModel(data:Object):void
		{
			if (data.hasOwnProperty("id_str"))
			{
				id = data["id_str"];
			}

			if (data.hasOwnProperty("text"))
			{
				text = data["text"];
			}

			if (data.hasOwnProperty("user") && data["user"].hasOwnProperty("screen_name"))
			{
				screenName = data["user"]["screen_name"];
			}

			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}

//{
//	"created_at": "Sun May 26 11:41:09 +0000 2013",
//	"id": 338620820903559169,
//	"id_str": "338620820903559169",
//	"text": "@whosyabuddha Drop die shit ouwe.",
//	"source": "web",
//	"truncated": false,
//	"in_reply_to_status_id": null,
//	"in_reply_to_status_id_str": null,
//	"in_reply_to_user_id": 1125110281,
//	"in_reply_to_user_id_str": "1125110281",
//	"in_reply_to_screen_name": "whosyabuddha",
//	"user": {
//		"id": 5760742,
//		"id_str": "5760742",
//		"name": "Bas",
//		"screen_name": "bgezelle",
//		"location": "Den Haag, Netherlands",
//		"description": "Creatief strateeg @ Tribewise. Rockt non stop met interactieve communicatie en op electronische muziek. Doet @NL_indeoorlog. Ook op FB: http:\/\/t.co\/pL5B3ppI3p",
//		"url": "http:\/\/t.co\/wwSIdurXX3",
//		"entities": {
//			"url": {
//				"urls": [{
//					"url": "http:\/\/t.co\/wwSIdurXX3",
//					"expanded_url": "http:\/\/www.rockrockplanetrock.nl\/",
//					"display_url": "rockrockplanetrock.nl",
//					"indices": [0, 22]
//				}]
//			},
//			"description": {
//				"urls": [{
//					"url": "http:\/\/t.co\/pL5B3ppI3p",
//					"expanded_url": "http:\/\/on.fb.me\/18u4Bif",
//					"display_url": "on.fb.me\/18u4Bif",
//					"indices": [136, 158]
//				}]
//			}
//		},
//		"protected": false,
//		"followers_count": 878,
//		"friends_count": 526,
//		"listed_count": 32,
//		"created_at": "Fri May 04 07:40:31 +0000 2007",
//		"favourites_count": 1182,
//		"utc_offset": 3600,
//		"time_zone": "Amsterdam",
//		"geo_enabled": false,
//		"verified": false,
//		"statuses_count": 19025,
//		"lang": "nl",
//		"contributors_enabled": false,
//		"is_translator": false,
//		"profile_background_color": "000000",
//		"profile_background_image_url": "http:\/\/a0.twimg.com\/profile_background_images\/878737896\/b3583f80909d8ce25cc644f63b7522b8.jpeg",
//		"profile_background_image_url_https": "https:\/\/si0.twimg.com\/profile_background_images\/878737896\/b3583f80909d8ce25cc644f63b7522b8.jpeg",
//		"profile_background_tile": false,
//		"profile_image_url": "http:\/\/a0.twimg.com\/profile_images\/3306264909\/c19d17d1733b57cfa48602322114dc3c_normal.jpeg",
//		"profile_image_url_https": "https:\/\/si0.twimg.com\/profile_images\/3306264909\/c19d17d1733b57cfa48602322114dc3c_normal.jpeg",
//		"profile_banner_url": "https:\/\/pbs.twimg.com\/profile_banners\/5760742\/1350822232",
//		"profile_link_color": "000000",
//		"profile_sidebar_border_color": "000000",
//		"profile_sidebar_fill_color": "000000",
//		"profile_text_color": "000000",
//		"profile_use_background_image": true,
//		"default_profile": false,
//		"default_profile_image": false,
//		"following": null,
//		"follow_request_sent": false,
//		"notifications": null
//	},
//	"geo": null,
//	"coordinates": null,
//	"place": null,
//	"contributors": null,
//	"retweet_count": 0,
//	"favorite_count": 0,
//	"entities": {
//		"hashtags": [],
//		"symbols": [],
//		"urls": [],
//		"user_mentions": [{
//			"screen_name": "whosyabuddha",
//			"name": "whosyabuddha",
//			"id": 1125110281,
//			"id_str": "1125110281",
//			"indices": [0, 13]
//		}]
//	},
//	"favorited": false,
//	"retweeted": false,
//	"lang": "nl"
//}