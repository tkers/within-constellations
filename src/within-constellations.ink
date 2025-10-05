# title: Within Constellations
# author: Tijn Kersjes <tkers.itch.io>
# ifid: F1DF4363-FFE1-43FB-BE37-A548DCFBA297

CONST captain = "Captain Holloway"
CONST shipname = "VSS Orion"

VAR exposure = 0

-> start

=== start ===

The alarms are blaring overhead.
* [Running]
- You keep on running, trying your best not to stumble over the falling debris.

Before long, you make it to the end of the corridor, where a large bulkhead separates the pod bay from the rest of the deck.

A small keypad lights up the wall around it.

* [Open pod bay]
   > Override lockdown? #system #flash #pause
   You reach for the keypad <>
* [Check for survivors]
   > Retrieving crew status... #system #pause
   > [ERR] Failed to connect. #system #flash #pause   
   Your fingers quickly move back to the keys <>
   
- and enter your access codes. The panel buzzes briefly, and the bulkhead in front of you slowly opens, allowing you to pass.

You quickly hop into the nearest escape pod, and close the hatch behind you. Flashing lights illuminate the interior. You don't have much time.

* [Launch]
- You brace yourself, as the pod is ejected from the hull. #pause-long

Away from the ship. #pause
Away from danger. #pause
Away from your home. #pause

-> just_escaped

== just_escaped ==

* [Breathe]
  You allow yourself a moment to catch your breath.
* Outside[] of the pod is nothing but vast, empty space.
* [Search]
   You search the pod, finding some basic supplies.

- {safe_for_now: -> ship_explodes}
- (safe_for_now) You're safe, for now, but you need to think fast. -> just_escaped

== ship_explodes ==
Before you get the chance to do anything else, a blinding light floods the pod. Your eyes start tearing, and it takes a while before you manage to open them again.

You take a look outside of the viewport, and watch in horror as your ship is consumed by a cold, white flare. The reactor core is burning, and with it, everything in its vicinity.

* Your crew[]! Did anyone else make it out in time?
- It all happened so fast, but you can't be the only one who managed to reach the escape pods, can you?

Green lights around the control panel indicate that your comms array is fully operational. If there are any survivors out there, you should be able to reach them.
-> search_crew 

== search_crew == 
* [Activate radio]
   -> activate_radio
* [Scan environment]
   -> proximity_scan

=== proximity_scan ===
> Running proximity scan... #system #pause-long
> Anomaly detected. #system #flash #pause
An anomaly? That doesn't sound good. Whatever destroyed your ship could be lurking in the darkness. Is it listening? Waiting for you to reveal your location?
Still... it could be another escape pod, either too damaged or too far to identify. If any of your crew is still alive, you have to try to reach them. The odds of survival by yourself are close to zero. Together, you might just stand a chance.
* [Try to hail them]
   You flick the switch to open a communication channel.
   -> radio
* [Don't risk it]
   Now's not the time to make hasty decisions. You have no idea what you're up against, so staying hidden might be your only hope.
   -> alone

=== activate_radio ===
As your finger hovers over the switch, a cold shiver runs down your spine. Whatever destroyed your ship is still out there. Is it listening? Waiting for you to reveal your location?
* [Flick the switch]
   It doesn't matter. You have to find out if anyone made it. #pause
   -> radio
* [Scan environment instead]
   Of course. No need to risk exposure without getting your bearings.
   -> proximity_scan

=== radio ===
~exposure++
> Comms online. #system
> Transmitting... #system #flash #pause
"Hello," you start nervously, but you manage to collect yourself quickly. "This is {captain} of the {shipname}. Does anyone copy?" #pause-long
* [Try again]
   "This is {captain}," you announce once more, "is anyone out there?!" #pause-long
* [Boost signal]
   ~exposure++
   > Range expanded. #system #pause
   > Transmitting... #system #flash #pause
   "Anyone," your voice pleading this time, "anyone at all?!" #pause-long
- > Awaiting response #system #ticker #pause
You hear nothing but faint static over the speakers. Either your signal is being jammed, or there's nobody left to hear it.
-> alone

=== alone ===
You're on your own.

Just you, a pack of freeze-dried rations, and the onboard computer.

// * "Status report[."]," you mutter in no particular direction.
//   The panel overhead lights up.
//   › Checking pod status... #system #pause-long
// * "Run diagnostics[."]," you say curtly.
//   One of the overhead screens comes to life.
//   › Running system diagnostics... #system #pause-long
// - › <font color="\#78d36c">[OK]</font> Hull Integrity #system
//    › <font color="\#78d36c">[OK]</font> Life Support #system
//    › <font color="\#78d36c">[OK]</font> Comms Array #system #pause

You should be able to survive at least a full cycle like this. Enough time for a rescue party to find you. #pause-long
That is, if they even know where to look.

* Alone[]. With only the gentle humming of the air scrubbers to keep you company. #pause-long
- Outside of your viewport, the remnants of your beloved ship drift past. A faint glow reminds you of the danger that still lingers. Invisible, but lethal to anyone who strays too close: radiation.
You've seen what a faulty reactor can do to the human body. A burning one will do much worse. Best not to linger. 

* [Leave the wreckage behind]
   ~exposure++
   With a final, melancholic look, you steer away from the wreckage. The pod's thrusters carry you deeper into the darkness, leaving behind the only thing that ever felt like home in this cold void. #pause-long
* [Wait in silence...]
   You don't know what you're up against, and you can't risk being detected.
   You carefully switch off all auxiliary systems, leaving only life support running.
   Afraid the vacuum outside might somehow expose you, you sit in absolute silence. #pause-long

- Your eyelids feel heavy. #pause-long
You're exhausted.
* [Rest]
- You fall into a restless slumber, only to wake to a faint beeping. The control panel is trying to get your attention. #pause-long
> Altitude Warning  #system #flash #pause-long
You blink slowly, not fully registering what's happening yet. But then you see it: a planet, looming right beneath you! Its gravitational field must have pulled you closer while you were asleep.
* [Course correction]
   As dire as your situation is, crashing on an alien world would make it even worse.
   -> correct_course
*  [Take a closer look]
   Looking down, you try to make out what planet you're orbiting. It doesn't look familiar. But why would it? You're in uncharted space. Nothing ever looks familiar here.
   The pod hums as you run a surface analysis. The atmosphere isn't toxic; you would be able to breathe normally, but there's no telling what else you might find.
   Then again, the pod isn't much of a home either. Supplies will run out eventually, and the odds of rescue are laughable at best. You can't drift forever. Maybe this planet, risky as it may be, is the only real chance you get?
   * * [Escape its orbit]
         It's a fleeting thought. Absurd, really. You'd never survive down there.
         -> correct_course
   * * [Attempt to land]
         -> planetfall

=== planetfall ===
You take a deep breath and plot a course for a potential landing site.
The escape pod, now a makeshift landing craft, plunges towards the strange world. You try to relax as you enter its atmosphere. There's no turning back now.
* [Brace]
- You brace yourself for impact, and your craft crashes onto the surface.
For a brief moment, all is still.
The hatch opens with a hiss, spilling warm light of an alien sun into the cabin. Your heart is racing as you move towards the opening.
* [Activate beacon]
   The pod's antennas are not designed for atmospheric use, but you might as well try.
   > Beacon activated. #system #pause
   > Broadcasting #system #flash #ticker #pause-long
   You close your eyes. It sounds almost poetic, starting a new life in a strange place like this. You imagine yourself becoming one with the stars, slowly dissolving into the constellations of the night sky. #pause
   * * [Step outside]
* [Step outside]
  You take a hesitant step, leaving the safety of your capsule behind. #pause

- Maybe someone will look for you. #pause-long
Maybe help will come. #pause-long
They must... right? #pause-long
They must.
-> fin

=== correct_course ===
With a few adjustments to the controls, you steer your pod away from the strange planet. The pod's thrusters take you deeper into the darkness of space.

You are far away from your old ship now. Far away from whatever attacked you. Far enough to be safe?
* [Activate distress signal]
   -> final_distress
* [Stay hidden]
   You can't be certain. You can't risk it. Silence is your only refuge. #pause-long
   You close your eyes. It is almost comforting, drifting through the cosmos like this. You imagine yourself becoming one with the stars, slowly fading away within the constellations of the night sky.
   * * [Wait]
   - - Maybe one day you'll make it home. #pause-long
   Maybe the danger will pass. #pause-long
   It must... right? #pause-long
   It must.
   -> fin

=== final_distress ===
> Beacon activated. #system #pause
> Broadcasting #system #flash #ticker #pause-long
You close your eyes. It feels almost peaceful, drifting through the cosmos like this. You imagine yourself becoming one with the stars, slowly dissolving into the constellations of the night sky. #pause

* [Wait]
- Maybe someone will hear you. #pause-long
Maybe help will come. #pause-long
They must... right? #pause-long
They must.
-> fin

=== fin ===
- [End of transmission] #fin
-> END
