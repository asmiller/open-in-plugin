# Open In PhoneGap plugin

## How To Use

        document.addEventListener("deviceready", onDeviceReady, false);

        function onDeviceReady() {        
            window.HelloWorld.say( 
                function(result) {
                    alert("result = " + result);
                },
                function() {
                    alert("error");
                }
            );
        }