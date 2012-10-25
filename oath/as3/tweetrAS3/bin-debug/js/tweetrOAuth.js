var OAuth = {}, oauthWin, swfId;

OAuth.setFlashElement = function (id) {
    swfId = id;
};

OAuth.callAuthorize = function (url) {
    oauthWin = window.open(url, "oauthWin", "width=780, height=500");
};

OAuth.verify = function () {

    var href, searchString, startIndex, sSLength, verifierToken;
    href = window.location.href;
    searchString = "oauth_verifier=";
    sSLength = searchString.length;
    startIndex = href.indexOf(searchString);
    verifierToken = href.substr(startIndex+sSLength, href.length);
    window.opener.OAuth.passVerifier(verifierToken);
    window.close();
};

OAuth.passVerifier = function (token) {
    if (!swfId) { alert("You never called OAuth.setFlashElement!"); }
    else { 
        flash = document.getElementById(swfId);
        flash.setVerifier(token); 
    }
};
 