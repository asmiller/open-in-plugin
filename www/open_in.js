var OpenIn = function () {
};

OpenIn.prototype.say = function (success, fail) {
    cordova.exec(success, fail, "OpenInPlugin", "say", []);
};

var openIn = new OpenIn();
module.exports = openIn;