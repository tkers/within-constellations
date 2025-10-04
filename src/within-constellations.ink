# title: Within Constellations
# author: Tijn Kersjes <tkers.itch.io>
# ifid: F1DF4363-FFE1-43FB-BE37-A548DCFBA297

VAR reactor_exploding = false

-> start

=== start ===

The alarms are blaring overhead.
* [Running]
- You keep on running, trying your best not to stumble over the debris.

// › Initiating system diagnostics... #system
// › Warning, Hull Critical #system #flash

Before long, you make it to the end of the corridor, where the bulkhead divides the pod bay from the rest of the ship.

A small keypad lights up the wall around it.

* [Access pod bay]
   You reach for the keypad <>
* [Check for survivors]
   › Retrieving crew status... #system #pause
   › [ERR] Failed to connect to mainframe! #system #flash #pause   
   Your fingers quickly move back to the keys <>
   
- and enter your access codes. The screen flashes briefly, and the bulkhead in front of you slowly opens.

You quickly hop into the escape pod closes to you, and lock the hatch behind you. Flashing lights illuminate the interiour. You don't have much time.

* [Launch]
- You brace yourself, as the pod is ejected from the hull. #pause

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

- {reactor_exploding: -> reactor_explosion}
You're safe, for now, but you need to think fast.
~reactor_exploding = true
-> just_escaped

== reactor_explosion ==

- End of transmission #fin
-> END