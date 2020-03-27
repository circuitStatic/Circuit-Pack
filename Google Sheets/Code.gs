/*

This is a simple spreadsheet tool for creating a controlled-vocabulary Twitter bot. 
It's logic is inspired by Darius Kazemi's GenGen, 
some of the code is from Amit Agarwal's example
which in turn uses some code by Martin Hawksey.

This hasn't been tested thoroughly, so if you find a bug 
or if you have suggestions, contact me on Twitter @zachwhalen .

*/

function authenticateTwitter () {
  oAuth();
  // I don't know why this doesn't work from the SS menu. :/
  var options =
  {
    "method": "POST",
    "oAuthServiceName":"twitter",
    "oAuthUseToken":"always"
  };
  
  var mention = "https://api.twitter.com/1.1/statuses/mentions_timeline.json?count=1";
  
  try {
    var result = UrlFetchApp.fetch(mention, options);
  
    Logger.log(result.getContentText());    
  }  
  catch (e) {
    Logger.log(e.toString());
  }
}

function setup(){
  
  
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('Setup');
  
  var triggers = ScriptApp.getScriptTriggers();
  
  for(var i=0; i < triggers.length; i++) {
    ScriptApp.deleteTrigger(triggers[i]);
  }
    
  // Read trigger options from Setup sheet
  
  var intervalType = sheet.getRange('b9').getValue();
  var intervalUnit = sheet.getRange('b10').getValue();
  
  
  
  if (intervalType[0] == 'H'){
    ScriptApp.newTrigger("sendTweet")
           .timeBased()
           .everyHours(intervalUnit)
           .create();
  }else{
    ScriptApp.newTrigger("sendTweet")
           .timeBased()
           .everyMinutes(intervalUnit)
           .create();
  }
  
  
  oAuth();
  
  
};


function stopTweets(){
    var triggers = ScriptApp.getScriptTriggers();
  
  for(var i=0; i < triggers.length; i++) {
    ScriptApp.deleteTrigger(triggers[i]);
  }
};

/**
 * Adds a custom menu to the active spreadsheet
 */
function onOpen() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet();
  var entries = [ { name : "Preview Output", functionName : "tweetCheck" },
  {name: "Send A Test Tweet", functionName : "sendTweet"}, null,
  {name : "Start Posting Tweets",functionName : "setup"},
                 {name : "Stop Posting Tweets", functionName : "stopTweets"}              
                ];
  sheet.addMenu("Bot", entries);
};


function composeTweet(){

  var tweet = '';
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('Vocabulary');
  var rows = sheet.getDataRange();
  var numRows = rows.getNumRows();
  var values = rows.getValues();
  
  // this will contain all the actual word options
  var list = new Array();
    
  for (var i = 1; i <= numRows - 1; i++){
    var row = values[i];
    list[i] = new Array();
    
    // find the actual limit of this row
    var len = 0;
    for (var j = 0; j <= row.length; j++){
      if (row[j]){
        list[i][j] = row[j]; 
      }
    }
  }
  
  for (var k = 1; k < list.length; k++){
    if (tweet.length < 140){
     // Logger.log(list[k]);
     var word = list[k][Math.floor(Math.random()*(list[k].length - 1)) + 1];
      
      // make sure word is not undefined
      if (word){
        
        var tweaked = word.replace(/\\n/g, "\n");
        tweet = tweet + " " + tweaked;
      }
      
     //Logger.log(encodeString(tweet));
    }
  }
  
  return tweet;
    
};

function tweetCheck (){
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('Preview');
  for (var t = 1; t <= 12; t++){
    
   var tweet = composeTweet(); 
   
    
    sheet.getRange('a' + t).setValue(t);
    sheet.getRange('b' + t).setValue(tweet);
    
  }
  
 ss.setActiveSheet(sheet);
  
}

function sendTweet() {
  
  oAuth();
  var tweet = composeTweet();
  
  
  var options =
  {
    "method": "POST",
    "oAuthServiceName":"twitter",
    "oAuthUseToken":"always"    
  };
  
  var status = "https://api.twitter.com/1.1/statuses/update.json";
  
  
  status = status + "?status=" + encodeString(tweet);

  
  try {
    var result = UrlFetchApp.fetch(status, options);
  
    Logger.log(result.getContentText());    
  }  
  catch (e) {
    Logger.log(e.toString());
  }
  
  
}


// Thank you +Martin Hawksey - you are awesome

function encodeString (q) {
  
  // Update: 09/06/2013
  
  // Google Apps Script is having issues storing oAuth tokens with the Twitter API 1.1 due to some encoding issues.
  // Henc this workaround to remove all the problematic characters from the status message.
  
  // This is the bug tracker for the problem this workaround addresses: https://code.google.com/p/google-apps-script-issues/issues/detail?id=3046#c10
  
  var str = q.replace(/\(/g,'{').replace(/\)/g,'}').replace(/\[/g,'{').replace(/\]/g,'}').replace(/\!/g, '|').replace(/\*/g, 'x').replace(/\'/g, '’');
  return encodeURIComponent(str);

//   var str =  encodeURIComponent(q);
//   str = str.replace(/!/g,'%21');
//   str = str.replace(/\*/g,'%2A');
//   str = str.replace(/\(/g,'%28');
//   str = str.replace(/\)/g,'%29');
//   str = str.replace(/'/g,'%27');
//   return str;

}

function oAuth() {

  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('Setup');
  var twitter_name = sheet.getRange('b2').getValue();
  var consumer_key = sheet.getRange('b3').getValue();
  var consumer_secret = sheet.getRange('b4').getValue();

  
  var oauthConfig = UrlFetchApp.addOAuthService("twitter");
  oauthConfig.setAccessTokenUrl("https://api.twitter.com/oauth/access_token");
  oauthConfig.setRequestTokenUrl("https://api.twitter.com/oauth/request_token");
  oauthConfig.setAuthorizationUrl("https://api.twitter.com/oauth/authorize");
  oauthConfig.setConsumerKey(consumer_key);
  oauthConfig.setConsumerSecret(consumer_secret);
 
}



