var mc_api = new function()
{
    this.params = {}
    var akshf =  /(?:.*\?)(.*$)/.exec(window.location);
    var pairs = (akshf?(akshf[1]?akshf[1].split("&"):[]):[]);
    while(pairs.length>0)
    {
      var p = pairs.pop().split("=");
      if(!(p[0]?this.params[p[0]] = p[1] : false))
      {
          continue;
      }
    }

    if(!this.params.width){this.params.width=800;};
    if(!this.params.height){this.params.height=600;};
    // workaround crossdoamin security
	if(this.params["domain"])
	{
		document.domain = this.params["domain"];
	}
	else
	{
		var domain = document.domain;
		if (domain != null && domain.length > 0)
			document.domain = String(document.domain);
	}
    //document.domain = (this.params["domain"] ? this.params["domain"] : String(document.domain));

   this.ready = false;

   var _callbacks = {lenght : 0};
   var services;

   this.init = function(api_callback, width, height)
   {
    this.registerAPICallback(api_callback);

    if(window.parent && window.parent.registerAPICallback)
    {
        window.parent.registerAPICallback(this.invokeCallbacks);
    }

    api_callback({noticeID:noticeIDs.READY});

   // prevents page scrolling
    window.addEventListener("keydown", function(e) {
    // space and arrow keys
        if([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1)
        {
            e.preventDefault();
        }
    }, false);
   };

    this.registerAPICallback = function(callback_function)
    {
        _callbacks[_callbacks.lenght++] = callback_function;
    };

    this.callAPI = function(method_name, argsObject)
    {
		console.log("mc_api.callAPI; method_name:"+method_name+" argsObject" + argsObject + " services " + services);

        if(window.parent && window.parent.callAPI)
        {
			console.log("*** callAPI --- window.parent.callAPI");

            window.parent.callAPI(method_name, argsObject);
            return;
        }

        if(services && services["onApiRequest"])
        {
          services["onApiRequest"](method_name, argsObject);
        }
        else
        {
          this.swfCallback({noticeID : "services_not_found"});
          this.lastNotice = null;
        }
    };

    this.swfCallback = function(data)
    {
       if(this.validateNotice(data["noticeID"]))
       {
           this.invokeCallbacks(data);
        };
    };

    this.invokeCallbacks = function(data)
    {
        var i = 0;
        while(i < _callbacks.lenght)
        {
           _callbacks[i++](data);
        }
    };

    this.validateNotice = function(noticeID)
    {
        if(noticeID != this.lastNotice)
        {
             this.lastNotice = noticeID;
             return true;
        }

        return false;
    }
};
//  noticeIDs gets populated by build.xml
var noticeIDs =
{
// async conversion
SCREENSHOT_DISPLAYED:"screenshot_displayed",
SCREENSHOT_REMOVED:"screenshot_removed",
// services
DECRYPT:"decrypt",
ENCRYPT:"encrypt",
VALIDATE_LOCATION:"validate_location",
//SiteConfigManagers Ready
SCM_READY:"scm_ready",
//Dispatched when the Game Manager has been fully initialized and is ready.
READY:"gamemanager_ready",
//Dispatched when the game.swf is fully loaded and displayed on screen.
GAME_READY:"gamemanager_game_ready",
USER_DETAILS:"auth_user_details",
GAME_BYTES_PRELOADED:"game_bytes_preloaded",
GAME_LOADED:"game_loaded",
GAME_DISPLAYED:"game_displayed",
GAME_INIT_TIMEOUT:"game_init_timeout",
GAME_LOAD_ERROR:"game_load_error",
GAME_DISABLE:"game_disable",
GAME_ENABLE:"game_enable",
// transplant form AuthenticationEvent
LOGIN_BOX_LOADED:"auth_login_box_loaded",
LOGIN:"auth_login",
LOGIN_CANCELLED:"auth_cancelled",
LOGIN_FAILED_USERNAME:"auth_login_failed_username",
LOGIN_FAILED_PASSWORD:"auth_login_failed_password",
LOGIN_FAILED_USER_BANNED:"auth_login_failed_user_banned",
LOGOUT:"auth_logout",
DISPLAY_STATE_CHANGED:"display_state_changed",
USERNAME_EXISTS:"auth_email_exists",
NICKNAME_EXISTS:"auth_nickname_exists",
SIGNUP:"auth_signup",
SIGNUP_FAILED:"auth_signup_failed",
PASSWORD_RESET:"auth_reset_password",
PASSWORD_RESET_FAILED:"auth_reset_password_failed",
AVATAR_STATUS:"player_avatar_stats",
AVATAR_STATUS_FAILED:"player_avatar_stats_failed",
AVATAR_DATA:"avatar_data",
GAME_STATS:"auth_game_stats",
ERROR:"auth_error",
AUTH_SERVICE_ERROR:"auth_service_error",
// ----------------------------------------------------------------------------------------------
// GameStorage Notices
// ----------------------------------------------------------------------------------------------
// StorageEvent
STORAGE_LOADED:"storage_loaded",
STORAGE_SAVED:"storage_saved",
// StorageErrorEvent
STORAGE_ERROR:"storage_error",
STORAGE_LOAD_FAILED:"storage_load_failed",
STORAGE_SAVE_FAILED:"storage_save_failed",
STORAGE_TIMEOUT:"storage_timeout",
// new
STORAGE_SET:"storage_set_complete",
STORAGE_GET:"storage_get_complete",
STORAGE_DELETE:"storage_delete",
// ghost
STORAGE_SET_GHOSTDATA:"storage_set_ghostdata_complete",
STORAGE_GET_GHOSTDATA:"storage_get_ghostdata_complete",
STORAGE_DELETE_GHOSTDATA:"storage_delete_ghostdata_complete",
STORAGE_LIST_GHOSTDATA:"storage_list_ghostdata_complete",
// ----------------------------------------------------------------------------------------------
// GameServices Notices
// ----------------------------------------------------------------------------------------------
// HighscoreEvent
HIGHSCORES_CLOSE_PARENT:"highscores_close_parent",
HIGHSCORES_CLOSE:"highscores_close",
// AwardsEvent
AWARD_GIVEN:"award_given",
AWARD_FAILED:"award_failed",
AWARD_SERVICE_ERROR:"award_service_error",
USER_GAME_AWARDS:"user_gme_awards",
// CreditsEvent
USER_BALANCE:"user_balacne",
TOPUP_WINDOW_CLOSED:"topup_window_closed",
TOPUP_WINDOW_OPENED:"topup_window_opened",
BALANCE:"credits_balance",
PURCHASED:"credits_purchased",
PURCHASE_FAILED:"credits_purchase_failed",
ITEM_QTY_DECREMENTED:"credits_itemqnt_decremented",
USER_ITEMS_BY_GAME_ID:"credits_user_items_by_gameid",
ITEM_TOTAL_USER_BALANCE:"credits_item_toal_u_balance",
ITEM_INFO:"credits_i_info",
GET_PRODUCT_BY_GAME_ID:"credits_product_by_gameid",
GET_PRODUCT_BY_ID:"credits_product_byid",
PURCHASE_ACCEPTED_BY_USER:"credits_purchase_accepted",
PURCHASE_CANCELLED_BY_USER:"credits_purchase_cancelled",
CREDITS_ERROR:"credits_error",
// CurrenciesEvent
CURRENCIES_READY:"currencies_ready",
CURRENCIES_INIT_FAILED:"currencies_init_failed",
CURRENCIES_BALANCE:"currencies_balance",
CURRENCIES_BALANCES:"currencies_balances",
CURRENCIES_PURCHASED:"currencies_purchased",
CURRENCIES_BUNDLE_PURCHASE_FAILED:"currencies_bundle_purchase_failed",
CURRENCIES_BUNDLE_PURCHASED:"currencies_bundle_purchased",
CURRENCIES_PURCHASE_FAILED:"currenciess_purchase_failed",
CURRENCIES_ITEM_QTY_DECREMENTED:"currencies_itemqnt_decremented",
CURRENCIES_PURCHASE_CANCELLED_BY_USER:"currencies_purchase_cancelled",
CURRENCIES_PURCHASE_ACCEPTED_BY_USER:"currencies_purchase_accepted",
CURRENCIES_CONVERT_CANCELLED_BY_USER:"currencies_convert_cancelled",
CURRENCIES_CONVERT_ACCEPTED_BY_USER:"currencies_convert_accepted",
CURRENCIES_CURRENCY_CONVERTED:"currencies_currency_converted",
CURRENCIES_CONVERSION_FAILED:"currencies_conversion_failed",
CURRENCIES_GET_ITEM_BY_ID:"currencies_item_byid",
CURRENCIES_GET_ITEMS_BY_GAME_ID:"currencies_items_gameid",
CURRENCIES_GET_BUNDLES:"currencies_bundles",
CURRENCIES_ITEM_INFO:"currencie_item_info",
CURRENCIES_GET_AVAILABLE_CURRENCIES:"currencies_available_currencies",
CURRENCIES_GET_CURRENCY_BY_ID:"currencies_currency_byid",
CURRENCIES_USER_ITEM_QUANTITY:"currencies_user_item_quantity",
CURRENCIES_USER_ITEMS_BY_GAME_ID:"currencies_user_items_by_gameid",
CURRENCIES_ERROR:"currencies_error",
CURRENCIES_GIVE_ITEM:"currencies_give_item",
CURRENCIES_TOPUP_CLOSED:"currencies_topup_closed",
CURRENCIES_OFFER_AVAILABILITY:"currencies_offer_availability",
CURRENCIES_OFFER_COMPLETE:"currencies_offer_complete",
//===
FRIENDS:"fiernds_succes",
LEADERBOARDS_SUBMIT_SCORE:"leaderboards_submit_score",
LEADERBOARDS_SHOW:"leaderboards_show",
EVENTS_LIST_ACTIVE:"events_list",
EVENTS_REGISTER_USER:"events_registe_user",
EVENTS_GET_EVENT:"events_get_event",
//Multiplayer Lobby;
REQUEST_LOBBY:"request_lobby",
LOBBY_LOADED:"lobby_loaded",
LOBBY_READY:"lobby_ready",
LOBBY_INIT_ERROR:"lobby_init_error",
// ----------------------------------------------------------------------------------------------
// GameChat Notices
// ----------------------------------------------------------------------------------------------
// GameChatEvent
CHAT_LOADED:"chat_loaded",
CHAT_LOAD_ERROR:"chat_loaderror",
CHAT_SUBMITTED:"chat_submitted",
CHAT_SUBMIT_ERROR:"chat_submiterror",
CHAT_LOAD_PROGRESS:"chat_loadprogress",
//  Video;
VIDEO_PLAYER_READY:"mcplayerready",
VIDEO_PLAYER_ERROR:"mcplayererror",
VIDEO_PLAYBACK_START:"mcplaybackstart",
VIDEO_PLAYBACK_END:"mcplaybackend",
VIDEO_PLAYER_DESTROYED:"mcplayerdestroyed",
VIDEO_CONFIG_RECEIVED:"configreceived",
VIDEO_PLAYER_CONFIG_RECEIVED:"playerconfigreceived",
VIDEO_SOUND_STATUS_CHANGED:"soundchanged",
METADATA_RECEIVED:"metadatareceived",
ADS_CONFIG_RECEIVED:"adsconfigrecived",
// ----------------------------------------------------------------------------------------------
// AlertBox and ConfirmDialog Notices
// ----------------------------------------------------------------------------------------------
// AlertboxEvent
OK_CLICKED:"okclicked",
YES_CLICKED:"yesclicked",
NO_CLICKED:"nolicked",
DISPLAY_CREDITS_CONFIRM_BOX:"displaycreditsconfirmbox",
DISPLAY_CURRENCIES_CONFIRM_BOX:"displaycurrenciesconfirmbox",
DISPLAY_ALERT_BOX:"displayalertbox",
POPUP_DISPLAYED:"popup_displayed",// last notice,

// ---------------------------------------------------------------------------------
//  auto-generated from synchronous calls
// ---------------------------------------------------------------------------------

ON_AMFGATEWAY:"on_AMFGateway",
ON_AVATARS_ALLOWDUPLICATES:"on_avatars_allowDuplicates",
ON_AVATARS_DEBUGMARKERS:"on_avatars_debugMarkers",
ON_AVATARS_GETAVATARURL:"on_avatars_getAvatarUrl",
ON_AVATARS_LOAD:"on_avatars_load",
ON_AVATARS_LOADBITMAP:"on_avatars_loadBitmap",
ON_CHAT_CHECKPHRASEACCEPTABLE:"on_chat_checkPhraseAcceptable",
ON_CHAT_GETFIRSTWORDBEGINNING:"on_chat_getFirstWordBeginning",
ON_CHAT_GETWORDSBEGINNING:"on_chat_getWordsBeginning",
ON_CHAT_INIT:"on_chat_init",
ON_CHAT_SUBMITBADPHRASE:"on_chat_submitBadPhrase",
ON_CREDITS_DECREMENTUSERITEMQUANTITY:"on_credits_decrementUserItemQuantity",
ON_CREDITS_CAPABILITIES:"on_credits_capabilities",
ON_CREDITS_GETBALANCE:"on_credits_getBalance",
ON_CREDITS_GETITEMINFO:"on_credits_getItemInfo",
ON_CREDITS_GETPRODUCTBYID:"on_credits_getProductById",
ON_CREDITS_GETPRODUCTSBYGAMEID:"on_credits_getProductsByGameId",
ON_CREDITS_GETSECONDARYVENDORICON:"on_credits_getSecondaryVendorIcon",
ON_CREDITS_GETTOTALUSERITEMBALANCE:"on_credits_getTotalUserItemBalance",
ON_CREDITS_GETUSERITEMSBYGAMEID:"on_credits_getUserItemsByGameId",
ON_CREDITS_GETVENDORICON:"on_credits_getVendorIcon",
ON_CREDITS_GETVENDORLOGO:"on_credits_getVendorLogo",
ON_CREDITS_PURCHASEPRODUCT:"on_credits_purchaseProduct",
ON_CREDITS_PURCHASEPRODUCTS:"on_credits_purchaseProducts",
ON_CREDITS_TOPUPCREDITS:"on_credits_topupCredits",
ON_CURRENCIES_ADJUSTCURRENCYBALANCE:"on_currencies_adjustCurrencyBalance",
ON_CURRENCIES_CONVERTCURRENCY:"on_currencies_convertCurrency",
ON_CURRENCIES_CURRENCIESOFFERAVAILABLE:"on_currencies_currenciesOfferAvailable",
ON_CURRENCIES_DECREMENTITEMBALANCE:"on_currencies_decrementItemBalance",
ON_CURRENCIES_GETAVAILABLECURRENCIES:"on_currencies_getAvailableCurrencies",
ON_CURRENCIES_GETBALANCE:"on_currencies_getBalance",
ON_CURRENCIES_GETBALANCES:"on_currencies_getBalances",
ON_CURRENCIES_GETBUNDLES:"on_currencies_getBundles",
ON_CURRENCIES_GETCONVERTEDAMOUNT:"on_currencies_getConvertedAmount",
ON_CURRENCIES_GETCURRENCYBYID:"on_currencies_getCurrencyById",
ON_CURRENCIES_GETCURRENCYICON:"on_currencies_getCurrencyIcon",
ON_CURRENCIES_GETITEMBYID:"on_currencies_getItemById",
ON_CURRENCIES_GETITEMSBYGAMEID:"on_currencies_getItemsByGameId",
ON_CURRENCIES_GETUSERITEMQUANTITY:"on_currencies_getUserItemQuantity",
ON_CURRENCIES_GETUSERITEMSBYGAMEID:"on_currencies_getUserItemsByGameId",
ON_CURRENCIES_GIVEITEM:"on_currencies_giveItem",
ON_CURRENCIES_INIT:"on_currencies_init",
ON_CURRENCIES_PURCHASEBUNDLE:"on_currencies_purchaseBundle",
ON_CURRENCIES_PURCHASEITEM:"on_currencies_purchaseItem",
ON_CURRENCIES_PURCHASEITEMS:"on_currencies_purchaseItems",
ON_CURRENCIES_SHOWOFFER:"on_currencies_showOffer",
ON_CURRENCIES_TOPUPCURRENCY:"on_currencies_topupCurrency",
ON_GAMECUSTOMPARAMETERS:"on_gameCustomParameters",
ON_INFO:"on_info",
ON_LEADERBOARDS_GETEVENT:"on_leaderboards_getEvent",
ON_LEADERBOARDS_LISTACTIVEEVENTS:"on_leaderboards_listActiveEvents",
ON_LEADERBOARDS_REGISTERUSER:"on_leaderboards_registerUser",
ON_LEADERBOARDS_SHOWLEADERBOARD:"on_leaderboards_showLeaderboard",
ON_LEADERBOARDS_SUBMITSCORE:"on_leaderboards_submitScore",
ON_LOBBY:"on_lobby",
ON_MIDROLL_INFOTEXT:"on_midRoll_infoText",
ON_MIDROLL_REQUESTVIDEO:"on_midRoll_requestVideo",
ON_PLAYER_USERDETAILS:"on_player_userDetails",
ON_PLAYER_GETAVATARSELECTION:"on_player_getAvatarSelection",
ON_PLAYER_GETUSERDETAILS:"on_player_getUserDetails",
ON_PLAYER_ISALREADYLOGGEDIN:"on_player_isAlreadyLoggedIn",
ON_PLAYER_ISLOGGEDIN:"on_player_isLoggedIn",
ON_PLAYER_LOGOUT:"on_player_logout",
ON_READY:"on_ready",
ON_SERVICES_DECRYPT:"on_services_decrypt",
ON_SERVICES_ENCRYPT:"on_services_encrypt",
ON_SERVICES_DATACENTERID:"on_services_datacenterID",
ON_SERVICES_HIGHSCORESVISIBLE:"on_services_highscoresVisible",
ON_SERVICES_USERDETAILS:"on_services_userDetails",
ON_SERVICES_GETUSERDETAILS:"on_services_getUserDetails",
ON_SERVICES_GIVEAWARD:"on_services_giveAward",
ON_SERVICES_HASAWARD:"on_services_hasAward",
ON_SERVICES_ISLOGGEDIN:"on_services_isLoggedIn",
ON_SERVICES_SAVEHIGHSCORE:"on_services_saveHighscore",
ON_SERVICES_SHOWALERT:"on_services_showAlert",
ON_SERVICES_SHOWHIGHSCORES:"on_services_showHighscores",
ON_SERVICES_TRACKADS:"on_services_trackAds",
ON_SERVICES_TRACKDATA:"on_services_trackData",
ON_SERVICES_TRACKERROR:"on_services_trackError",
ON_SERVICES_TRACKMAPPEDERROR:"on_services_trackMappedError",
ON_SERVICES_VALIDATELOCATION:"on_services_validateLocation",
ON_SHAREDGUI_GAMESHAREDGUI:"on_sharedGui_GameSharedGUI",
ON_SHAREDGUI_MAPSTATES:"on_sharedGui_mapStates",
ON_SOCIALAPI_CHALLENGEFRIEND:"on_socialAPI_challengeFriend",
ON_SOCIALAPI_DELETEFRIEND:"on_socialAPI_deleteFriend",
ON_SOCIALAPI_GETFRIENDSHIP:"on_socialAPI_getFriendship",
ON_SOCIALAPI_INVITEFRIEND:"on_socialAPI_inviteFriend",
ON_SOCIALAPI_LISTUSERSFRIENDED:"on_socialAPI_listUsersFriended",
ON_SOCIALAPI_LISTUSERSFRIENDING:"on_socialAPI_listUsersFriending",
ON_SOCIALAPI_POSTMESSAGE:"on_socialAPI_postMessage",
ON_SOCIALAPI_SAVEFRIEND:"on_socialAPI_saveFriend",
ON_SOCIALAPI_SUBMITAWARD:"on_socialAPI_submitAward",
ON_SOCIALAPI_SUBMITSCORE:"on_socialAPI_submitScore",
ON_SPONSORSHIP_COMPLETEDATA:"on_sponsorship_completeData",
ON_STORAGE_CACHEDATA:"on_storage_cacheData",
ON_STORAGE_DELETEDATA:"on_storage_deleteData",
ON_STORAGE_GET:"on_storage_get",
ON_STORAGE_DATA:"on_storage_data",
ON_STORAGE_LIMIT:"on_storage_limit",
ON_STORAGE_NOTIFICATIONS:"on_storage_notifications",
ON_STORAGE_LOAD:"on_storage_load",
ON_STORAGE_SAVE:"on_storage_save",
ON_STORAGE_SET:"on_storage_set",
ON_TRACKING_GAMEID:"on_tracking_gameID",
ON_TRACKING_LOCALE:"on_tracking_locale",
ON_TRACKING_SESSIONID:"on_tracking_sessionID",
ON_TRACKING_TIME:"on_tracking_time",
ON_TRACKING_TIMESTAMP:"on_tracking_timeStamp",
ON_TRACKING_UNIQUEID:"on_tracking_uniqueID",
ON_TRACKING_USERID:"on_tracking_userID",
ON_UTILS_UTILS:"on_utils_Utils",
ON_UTILS_GETABSOLUTEURI:"on_utils_getAbsoluteURI",
ON_VERSION:"on_version",
ON_HASEVENTLISTENER:"on_hasEventListener"
}