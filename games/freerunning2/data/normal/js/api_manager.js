var USE_UNITY_SCREENSHOT = true;

function ApiManager(_canvas, api, w, h)
{
	if (!ApiManager.instance)
	{
	   ApiManager.instance = this;
    }

    this.canvas = _canvas;
    this.api  = api;
    this.api.init(this.api_callback, w, h);
}

ApiManager.prototype.api_callback = function(data)
{
	if(data)
	{
	   console.log("*** api_callback: noticeID " + data["noticeID"] );

	   switch(data["noticeID"])
	   {
		   case noticeIDs.READY:
				SendMessage ('MiniclipApiManager', 'MAPI_Ready', '');
				console.log("*** api_callback: READY" );
				break;
		   case noticeIDs.GAME_DISABLE:
				SendMessage ('MiniclipApiManager', 'MAPI_Disabled', 'true');
				ApiManager.instance.disable();
				console.log("*** api_callback: GAME_DISABLE" );
				break;
		   case noticeIDs.GAME_ENABLE:
				SendMessage ('MiniclipApiManager', 'MAPI_Enabled', 'true');
				ApiManager.instance.enable();
				console.log("*** api_callback: GAME_ENABLE" );
				break;

			case noticeIDs.HIGHSCORES_CLOSE:
				SendMessage ('MiniclipApiManager', 'MAPI_HighscoresClose', 'true');
				console.log("*** api_callback: HIGHSCORES_CLOSE" );
				break;

		   default:

				 var msg = "";
				 for (var key in data)
				 {
					 if(key === "payload")
					 {
					   var isCollection = false;

						if(typeof data["payload"] != "object")
						{
						   msg+="\n   data.payload="+data["payload"];
						}
						else
						{
							for (var key0 in data["payload"])
							{
								isCollection = true;
								msg+="\n   data.payload."+key0+"="+data["payload"][key0];
							}
						}
					 }
					 else
					 {
						  msg+="\n   data."+key+"="+data[key];
					 }
				 }
			console.log("*** api_callback: " + msg);
		};
	}
	else
	{
		//TODO: error reporting for missing data object
	}
}

ApiManager.prototype.disable = function()
{
    ApiManager.instance.canvas.style.display = 'none';
};

ApiManager.prototype.enable = function()
{
   ApiManager.instance.canvas.style.display = 'block';
};

ApiManager.prototype.renderScreenshot = function()
{
	var imgData = ApiManager.instance.canvas.toDataURL("image/jpg", 0.2);
	return imgData;
};

function InitMiniclipApi()
{
	var gameCanvas = document.getElementById("canvas");
	var apiManager = new ApiManager(canvas, mc_api, 680, 510);
	//apiManager.init(gameCanvas, mc_api, 680, 510, "Free+Running+2", 3798);
}

function SaveHighscore(score, level, levelName, screenshot)
{
	SendMessage ('MiniclipApiManager', 'MAPI_Enabled', 'true');
	SendMessage ('MiniclipApiManager', 'MAPI_HighscoresClose', 'true');
	ApiManager.instance.enable();

	//mc_api.callAPI("MiniclipAPI.services.saveHighscore", {parametersArray:[score/*String*/, level/*String*/, levelName/*String*/], screenshot:base64/*bitmap data*/})
/*
	var args = {};
	var parametersArray = [score, level, levelName];

	args["parametersArray"] = parametersArray;

	if(USE_UNITY_SCREENSHOT)
		args["screenshot"] = screenshot;
	else
		args["screenshot"] = ApiManager.instance.renderScreenshot();

	var screenshotArg;
	if(USE_UNITY_SCREENSHOT)
		screenshotArg = screenshot;
	else
		screenshotArg = ApiManager.instance.renderScreenshot();

	args["screenshot"] = screenshotArg;

	//var args = '{ "parametersArray" : ["' + score + '","' + level + '","' + levelName + '"], "screenshot": "' + screenshotArg + '"}';
	//var args = "{ parametersArray : ['" + score + "','" + level + "','" + levelName + "'], screenshot: '" + screenshotArg + "'}";


	ApiManager.instance.api.callAPI("MiniclipAPI.services.saveHighscore", args);
*/
};

function ShowHighscores(level, levelName, screenshot)
{
	SendMessage ('MiniclipApiManager', 'MAPI_Enabled', 'true');
	ApiManager.instance.enable();

/*
	var args = {};
	var parametersArray = {};
	if(level)
		parametersArray["level"] = level;
	else
		parametersArray["level"] = "";

	if(levelName)
		parametersArray["levelName"] = levelName;
	else
		parametersArray["levelName"] = "";
	args["parametersArray"] = parametersArray;

	if(USE_UNITY_SCREENSHOT)
		args["screenshot"] = screenshot;
	else
		args["screenshot"] = ApiManager.instance.renderScreenshot();


	ApiManager.instance.api.callAPI("MiniclipAPI.services.showHighscores", args);
*/
};
