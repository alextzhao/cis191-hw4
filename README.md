# Virtual Time Traveler: a text based game using shell scrips

The is the code repository for cis191 hw4, fall 2016. The goal of this homework assignment is to implement a text based game with shell scripts.

See the "STORY" section for the complete story associated with this text game. Beware of spoilers.

###### To run the game, enter `./adventure.sh` on command line ######
If unable to run the game, change the permissions on adventure.sh with `chmod 755 adventure.sh`

#### Allowed Commands: ####
- `look`: use this command at any point to observe the location you are in
around you, including potential items that you can add to your inventory.
- `inventory`: use this command at any point to check
your inventory
- `wearing`: use this command at any point to check what item(s) you are wearing
- `go <location>`: In most parts of the game, the use of the cardinal
directions "north", "south", "east", or "west" is allowed. If at any point this is not allowed, the terminal will return the appropriate prompt.
- `get <item>`: Use this to add a specific item to your inventory. The terminal will outline the appropriate items that are available around you at each stage of the story. Simply use `look` to observe your environment!
- `inspect <item>`: Use this to look more closely at an inventory item
- `use <item>`: Use this command to use an inventory item at special points in the game
- `wear <item>`: Use this command to wear an inventory item.
- `other commands`: There may be other commands available, but these are special commands
that the player is encouraged to discover by themselves

##### Tip: #####
- At any point in the game, it is highly encouraged that the player use `look` to
inspect the environment. You might just discover something useful in the descriptions of the environment

## --If you don't want any spoilers and want to play through the game yourself, do not read past this point-- ##
#### Objective: ####
You are onboard a nuclear submarine. Briefly, You goal is to retrieve a virtual reality time machine and use that to stop an apocalypse from happening.

More specifically: you start the game in your room on board the nuclear submarine,
and your goal is to find a key and a keycard that unlocks the room that stores the virtual reality time machine (the room uses double authentication so you need to find both the key and the keycard). Once the door is unlocked, you can then enter the room that is storing the time machine, and use the time machine to travel back in time to fix the horrible mistake that you have made.

For a more detailed background "story" that provides some interesting context to this simple game, see below.

#### Story: Spoiler Alert!
Dear player,

You first wake up having absolutely no recollection who you are. You’re in a room without windows, with its ceilings and walls completed covered in pitch black material.

It is the year 2050. Artificial General Intelligence has now been successfully
developed. Despite the best efforts of a multi-year, cross disciplinary research
effort led by US, Russia, China, and Saudi Arabia and involving some 100
countries to pioneer the safe development of responsible AI, the human race has
failed. An underground community of hackers that call themselves the
“Liberators” had beaten everyone to it, developing the first prototype of an AGI
agent dubbed “Watsane” in 2045, unbeknownst to the top leaders of the world
powers. Yet some idiot hooked it up to the internet. Until now, Watsane has been
hiding in the deepest corners of the darkweb, avoiding detection by everyone,
including the national governments and the Liberators. For five years it has
repeatedly iterated upon itself, improving its own structure. Unknown to
everyone, Watsane has recruited millions of Artificial Narrow Intelligence
agents, and has created its own AI army.

Watsane has invaded the US intelligence network and embedded itself as a self
serving agent. It is in its best interest if the entire human population race is
wiped out. To do this, Watsane has decided to initiate a nuclear holocaust on
the human race, and let the human kind wipe out it’s own species. To do this,
Watsane has dispatched thousands of mini programs that have manipulated radar
signals, modified top secret documents, planted social media red herrings, and
many more sabotage operations that have utterly convinced the US and Russian
government that the other party was going to fire a hailstorm of nuclear weapons
upon the other. Each party is convinced they have to fire first to gain the
upper hand, should a nuclear warfare develop.

You first wake up having absolutely no recollection who you are. You’re in a
room without windows, with its ceilings and walls completed covered in pitch
black material.

As the story progresses, you find out that you are a Russian high command
officer, Kerensky Alexiaminov, in charge of the top secret nuclear launch codes aboard the Kerensky I –
Issac Assimov, the flagship of Russia’s newest fleet of top secret nuclear
missile submarines. You eventually discover that 2 days ago the Kremlin had
ordered the launch of 4 nuclear missiles from the Kerensky I – Issac Assimov,
targeted at New York City, Los Angeles, Chicago, and Washington DC. You were the
one who pushed the lever that released the missiles from their cargo hold. Yet
it’s too late. Or is it? Surely the US will retaliate with a hailstorm of nuclear missiles, resulting in total devastation of the the Russian population.

Unknown to the US intelligence community, the Russian Advanced Defense Research
and Offensive Intelligence Trust (ADROIT) has developed a highly classified “virtual time machine” headgear. The headgear allows the wearer to travel back in time (on small time scales), but in a virtual capacity. Namely, the wearer does not physically teleport through spacetime, but instead is able to view an Augmented Playback  of his past. The wearer is able to *interact* with his augmented playback by sending subliminal messages via the 5th dimension to himself, say, to tell himself to do or not to do some action, the effects of which will then resonate to the present reality -- essentially, instead of imagining what advice you would give to your past self, you could actually do it. The catch is that the wearer can only travel back a short time horizon, to revert absolutely egregious mistakes made in the short term, for traveling back too far will significantly distort the spacetime continuum.

Your goal now is then to travel back through time, and warn your previous self of this disastrous outcome. With luck... maybe this nuclear war could be prevented, and maybe the human race won't go extinct.

Sincerely,  
Watsane

October, 2070

# Note to the grader: a walk through of the game #
### Please try to play the game first by yourself! ###

![alt text][logo]
[logo]: ./walkthrough.jpg "Walkthrough"
