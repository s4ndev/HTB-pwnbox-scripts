# HTB-pwnbox-scripts
- Do you f*****g hate HTB's online VNC viewer? me too!

## Get Started:

### - Server Side

1. In Pwnbox's home, open the user_init script (this script gets run by HTB every time a new Pwnbox gets deployed)
2. Insert:

    sudo wget https://github.com/s4ndev/HTB-pwnbox-scripts/blob/main/pwnbox_init.sh
    && sudo chmod +x pwnbox_init.sh
    && ./pwnbox_init.sh

3. Done! Wait ~3 minutes after deployment and continue to the Client Side section!

### - Client Side

> What we did in the server side section is mainly deploy an xRDP server (amongst other things). We won't be able to directly RDP to Pwnbox's assigned hostname/IP because their janky reverse > proxy or maybe we aren't meant to do that ¯\_(ツ)_/¯. But the website quite literally says HackTheBox so I'll take that as consent make some slight improvements to the service that I am > paying for :), please accept my fellow condolenses for the added CPU usage but it is advertised that VIP+ members get a "personal server". 

1. Please make sure to wait a few minutes for the script to finalise on the Pwnbox server.

2. Connect to the server using RDP over SSH. (establish an ssh tunnel which will also act as a translation between your (localhost) 3389/tcp port to Pwnbox's interface on port 3389/tcp.

   - for those a bit confused, please refer to script [example_client.sh] for a dodgy example of how everything works, tested to work on MacOS/Linux but should be easily translatable for Windows, but there are a few dependencies to install first so please check the 1st line (will organise this information later).
   

------------------------------------------------------------------------------------------------------------------

Currently my main objective is to configure the RDP (xRDP) server [over xORG] to serve content with the highest performance and lowest latency without sacrificing too much quality.

This is also demonstrated in the [example_client.sh] file that is in the main repo, I am in the process of finding the best args to use to connect to the Pwnbox instance.

- Improvements made so far....
  - Using xRDP over xORG instead of xRDP over VNC (no explanation needed, VNC is ....)
  - Reduce unnecessary processes that will affect the performance of the RDP session (when it comes to remote management protocols like these, the more static the content the better in
      terms of performance, therefore unnecessary 3D effects, animations etc will not be beneficial whatsoever).
  - Find the best arguements to use with FreeRDP client to connect to the Pwnbox's RDP server. (50% done)

