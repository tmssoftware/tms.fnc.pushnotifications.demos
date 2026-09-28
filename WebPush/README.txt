===========================================================
             TMS FNC Push Notifications demo 
           Web Push server & client connection
===========================================================

Description:

The demo is made of two parts:
- Server:    The push server that handles the incoming
             subscriptions
- WebClient: The PWA web client where the subscription can
             be registered 

The demo automatically generates a VAPID key and does not 
connect to a database directly for simplicity. However,
it still uses the TMSFNCWebPushDB component. This means 
a TClientDataSet will be created internally and a 
dataset.xml file will be generated while the executable is 
running.

===========================================================

Usage:

1. Build the server in the Server folder. The output will 
be the Server\bin folder, which contains the necessary 
Win32 DLLs:
- ssleay32.dll
- libeay32.dll
- WebPush.dll

2. Start the server application and click the "Start push 
server" button. At this point the server should be running.

3. Start the client application from the WebClient folder.
This application is dependent on TMS WEB Core.
If you don't have TMS WEB Core, use the WebClient/dist folder
and host that via a local webserver.

4. In the running client application write a UserID in the 
edit field and click "Subscribe"

5. The client will automatically request the VAPID key from
the server and register a subscription object. This object
will be sent back to the server.

6. In the server application click the "Send to all" button
to send a notification constructed from the Title, Body and 
optionally URL fields.