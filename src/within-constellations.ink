# title: Within Constellations
# author: Tijn Kersjes <tkers.itch.io>
# ifid: F1DF4363-FFE1-43FB-BE37-A548DCFBA297

CONST captain = "Captain Holloway"
CONST shipname = "VSS Orion"

VAR reactor_failing = false
VAR exposure = 0

-> start

=== start ===

The alarms are blaring overhead.
// * \ {shipname}[], first of its class. Once the pride of the fleet, but now barely holding together.
* [Running]
- You keep on running, trying your best not to stumble over the falling debris.

// › Initiating system diagnostics... #system
// › Warning, Hull Critical #system #flash

Before long, you make it to the end of the corridor, where a large bulkhead separates the pod bay from the rest of the deck.

A small keypad lights up the wall around it.

* [Open pod bay doors]
   › Override lockdown? #system #flash #pause   
   You reach for the keypad <>
* [Check for other survivors]
   › Retrieving crew status... #system #pause
   › [ERR] Failed to connect. #system #flash #pause   
   Your fingers quickly move back to the keys <>
   
- and enter your access codes. The panel buzzes briefly, and the bulkhead in front of you slowly opens, allowing you to pass.

You quickly hop into the nearest escape pod, and close the hatch behind you. Flashing lights illuminate the interiour. You don't have much time.

* [Launch]
- You brace yourself, as the pod is ejected from the hull. #pause-long

Away from the ship. #pause
Away from danger. #pause
Away from your home. #pause

-> just_escaped

== just_escaped ==

* [Catch your breath]
  You allow yourself a moment to catch your breath.
* Outside[] of the pod is nothing but vast, empty space.
* [Look around]
   You search the pod, finding some basic supplies.

- {safe_for_now: -> ship_explodes}
- (safe_for_now) You're safe, for now, but you need to think fast.
-> just_escaped

== ship_explodes ==
Before you get the chance to do anything else, a blinding light floods the pod. Your eyes start tearing, and it takes a while before you manage to open them again.

You take a look outside of the viewport, and watch in horror as your ship is consumed by a cold, white flash. The reactor core is gone, and with it, everything in its vicinity.

* Your crew[]! Did anyone else make it out in time?
- It all happened so fast, but you can't be the only one who managed to reach the escape pods. Can you?

Green lights around the control panel indicate that your comms array is fully operational. If there are any survivors out there, you should be able to reach them.
-> search_crew 

== search_crew == 
* [Activate radio]
   -> activate_radio
* [Scan environment]
   -> proximity_scan

=== proximity_scan ===
› Running proximity scan... #system #pause-long
› Anomaly detected. #system #flash #pause
An anomaly? That doesn't sound good. Still, it could be another escape pod–either too damaged or far away to recognise.
If any of your crew is still alive, you should try to reach them. The odds of survival by yourself are close to zero. But together, maybe you have a chance.
* [Try to hail them]
   You flick the switch to open a communication channel.
   -> radio
* [Don't risk it]
   Now's not the time to make hasty decisions. You're no use to anyone if you're dead.
   -> lost_crew

=== activate_radio ===
As your finger hovers over the switch, a cold shiver runs down your spine. Whatever destroyed your ship is still out there. Is it listening? Waiting for me to reveal my location?
* [Flick the switch]
   It doesn't matter, you need to know if anyone else made it out. #pause
   -> radio
* [Scan environment instead]
   Of course, no need to expose yourself without getting your bearings first.
   -> proximity_scan

=== radio ===
~exposure++
› Comms online. #system
› Transmitting... #system #flash #pause
"Hello," you start nervously, but you manage to collect yourself quickly, "this is {captain} of the {shipname}. Does anoyone copy?" #pause-long
* [Try again]
   "This is {captain}," you declare once again, "is anyone out there?" #pause-long
* [Boost signal]
   ~exposure++
   › Range expanded. #system #pause
   › Transmitting... #system #flash #pause
   "Anyone," your voice pleading this time, "anyone at all?" #pause-long
- › [ERR] No signal detected. #system #pause
You hear nothing but the faint static noise over the speakers. Either something is jamming your signal, or there's nobody left to hear you.
-> lost_crew


=== lost_crew ===

Your fuel reserves are running low. Even if there was anywhere you wanted to navigate to, you won't get very far.
* [Activate distress signal]
  › Beacon activated. #system #pause   
  › Broadcasting... #system #flash #pause-long
- It feels almost peaceful, drifting through the cosmos. You imagine yourself becoming one with the stars, slowly dissolving into the constellations of the night sky. #pause

* [Wait]
- Maybe someone will hear you. #pause
Maybe help will come. # pause
They must... right? #pause-long
They must.

- End of transmission #fin
-> END