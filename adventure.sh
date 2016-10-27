#!/bin/bash

#### List of possible locations ####
# room
# corridor intersection
# engineRoom
# periscopeRoom
# timeMachineRoom
# timeMachineRoomOutside
# armory

currLocation='room'

# indicates the number of locks left on the timeMachineRoom
# using the key and keycard when at timeMachineRoomOutside removes one lock.
numberLocksLeft=2

# TODO: Need to add a timeMachineRoomOutside location to everywhere...

spacer="-----------------------------------------------------------------------"
welcomeMessage=$"Welcome. You wake up having absolutely no recollection
who you are. You have a throbbing headache. You’re in a room without windows,
with its ceilings and walls completed covered in pitch black material. What
would you like to do?"


function displayHelp {
  echo $spacer
  echo "look: use this command at any point to observe the location you are in
  around you, including potential items that you can add to your inventory.

  inventory: use this command at any point to check
  your inventory

  wearing: use this command at any point to check what item(s) you are wearing

  go <location>: In most parts of the game, the use of the cardinal
  directions 'north', 'south', 'east', or 'west' is allowed. If at any point
  this is not allowed, the terminal will return the appropriate prompt.

  get <item>: Use this to add a specific item to your inventory.
  The terminal will outline the appropriate items that are available around you
  at each stage of the story. Simply use look to observe your environment!

  inspect <item>: Use this to look more closely at an inventory item

  use <item>: Use this command to use an inventory item at special points in the game

  wear <item>: Use this command to wear an inventory item."

  echo $spacer
}



# ##############################################################################
# A short description of a new location
# ##############################################################################
function initialLocationMessage {
  case $1 in
    room ) echo "You seem to have arrived back in your room"
      ;;
    corridor ) echo "This sketchy corridor intersection is doing nothing for your nerves"
      ;;
    engineRoom ) echo "The room seems to be surprising silent... what is going on?"
      ;;
    periscopeRoom ) echo "Again this enclave is also empty. There's just enough space
    for one person. You squeeze in."
      ;;
    timeMachineRoom ) echo "Unlike any of the other rooms, this room is not silent.
    But it's also not loud...it's hard to describe, but there seems to be this
    mysterious energy in the room, buzzing and whispering, seemingly from all
    directions and from no direction at the same time."
      ;;
    timeMachineRoomOutside ) echo "You push hard with no avail. How does this open???"
      ;;
    armory ) echo "The room is somber and silent, as if it is a symbolism of a
    great tragedy that has happened."
      ;;
    codeRoom ) ## TODO: Do somethign.
      ;;
    * ) echo "not a valid location"
      ;;
  esac
}



# ##############################################################################
# Function to change locations, also dependent on where you currently are.
# ##############################################################################
function goto {
  case $1 in
    # Go North - behavior depends on current location
    [Nn]orth )
        case $currLocation in
          room ) echo "you bump into the black wall so hard you nearly kill yourself"
            ;;
          corridor ) echo "you up down the corridor and arrive at a room"; initialLocationMessage engineRoom;
            currLocation=engineRoom;
            ;;
          engineRoom ) echo "you can't go north from here"
            ;;
          periscopeRoom ) echo "you can't go north from here"
            ;;
          timeMachineRoom ) echo "you can't go north from here"
            ;;
          timeMachineRoomOutside ) echo "You cannot go north from here"
            ;;
          armory ) echo "you walk back up the corridor"; initialLocationMessage corridor;
            currLocation=corridor;
            ;;
          codeRoom ) echo "you can't go north from here"
            ;;
          * ) echo "error: currentLocation $currLocation is not valid"
            ;;
        esac
      ;;

    # Go South - behavior depends on current location.
    [Ss]outh )
        case $currLocation in
          room ) echo "you bump into the wall. You look up and there is a calendar flipped
          to the month of October. All the dates up to October 9th are crossed out.
          For some reason October 10th is circled. But unfortunately
          you don't quite remember what date it is now just by looking at the calendar"
            ;;
          corridor ) echo "you walk down the corridor and arrive at a room that seems to be stacked with weapons";
            initialLocationMessage armory; currLocation=armory;
            ;;
          engineRoom ) echo "you walk down the corridor. Looks familiar."; initialLocationMessage corridor;
            currLocation=corridor;
            ;;
          periscopeRoom ) echo "you cannot go south from here"
            ;;
          timeMachineRoom ) echo "you cannot go south from here"
            ;;
          timeMachineRoomOutside ) echo "You cannot go south from here."
            ;;
          armory ) echo "you cannot go south from here"
            ;;
          codeRoom ) echo "you cannot go south from here"
            ;;
          * ) echo "error: currentLocation $currLocation is not valid"
            ;;
        esac
      ;;

    # Go East. Behavior depends on current location.
    [Ee]ast )
        case $currLocation in
          room ) echo "you find a door and you walk out. A narrow corrirdor greets you.
          There seems to be pipes running along the curved walls of this 'corridor'
          and metal grates everywhere. What is this place?? You continue walking and
          arrive at an intersection"; initialLocationMessage corridor;
          currLocation=corridor;
            ;;
          corridor ) echo "After hesitating for just a second, you decide to venture
          further east. At the end of the corridor is a tiny little enclave, with
          seemingly advanced technology lining the walls." ; initialLocationMessage periscopeRoom;
          currLocation=periscopeRoom;
            ;;
          engineRoom ) echo "You trip over but quickly catch yourself. You look down
          and realize that you've just tripped over a body. Shuddering, all you
          can think of is to get out of this place, whatever it is, as quickly as possible.
          Good thing there is a door, and you quickly go through it and enter a room;"
          initialLocationMessage codeRoom; currLocation=codeRoom;
            ;;
          periscopeRoom ) echo "you cannot go east from here"
            ;;
          ## TODO: FIX THE LOGIC TO THIS.
          timeMachineRoom )
            if [[ $(grep -oi helmet wearing | wc -l) -ne 0 ]]
            then
              echo "there seems to be a forcefield emitted by the helmet blocking
              your way. You try to push through it, reaching for the door. But
              after several attemps you nearly collapse in exhaustion. You're still
              in the same place but feel several years older".
            else
              echo "you dislike the mysterious energy in the room and walk back
              out, tracing your steps and arrive back at the somber, silent room
            filled with guns"
              currLocation=armory;
            fi
            ;;
          timeMachineRoomOutside ) echo "You walk back up the long corridor, and arrive
          back in the armory"; currLocation=armory;
            ;;
          armory ) echo "you cannot go east from here"
            ;;
          codeRoom ) echo "you cannot go east from here"
            ;;
          * ) echo "error: currentLocation $currLocation is not valid"
            ;;
        esac
      ;;

    # Go West. Behavior depends on current location
    [Ww]est )
      case $currLocation in
        room ) echo "you try to walk but you snap back in pain as your knee hits something.
        Looking down you realize that you hit your own bed frame. There also seems to
        be a sofa nearby."
          ;;
        corridor ) echo "you walk down the corridor"; initialLocationMessage room;
        currLocation=room;
          ;;
        engineRoom ) echo "you cannot go west from here"
          ;;
        periscopeRoom ) echo "you walk down the corridor and arrive back at the intersection";
        initialLocationMessage corridor; currLocation=corridor
          ;;
        timeMachineRoom ) echo "you cannot go west from here"
          ;;
        timeMachineRoomOutside )
          if [[ numberLocksLeft -ne 0 ]]
          then
            echo "Good try. But no matter how hard you push, twist, yell... the
            heavy door just won't open. But you SWEAR you remember this place and
            that there was a way to open it...";
          else
            "Finally, with the door unlocked, you enter the mysterious room."
            initialLocationMessage timeMachineRoom; currLocation=timeMachineRoom;
          fi
          ;;
        armory ) echo "you follow the corridor and start walking. For some reason,
        this corridor seem extraaa long. After who knows how much time, you finally
        arrive at what looks like a very heavy door. You try to enter but the door
        seems locked."
          initialLocationMessage timeMachineRoomOutside;
          currLocation=timeMachineRoomOutside
          ;;
        codeRoom ) echo "you shudder when you think about the dead body on the
        other side of the door. After a moment of hesitation you decide to still exit.
        You're a brave soul, you tell yourself. You walk out the door and arrive back
        at the engine room, this time taking care to not trip over the body again.
        The room is still dead silent."; currLocation=engineRoom;
          ;;
        * ) echo "error: currentLocation $currLocation is not valid"
          ;;
      esac
        ;;
      * ) echo "invalid direction. Please use North, South, East, West"
  esac
}


# ##############################################################################
# function to Look around at a location
# ##############################################################################
function lookaround {
  case $currLocation in
    room ) echo "you look around. You're in what looks like a college dorm room,
    except more austere. There's a single bed pushed to one side of the room, and
    to your right there's a sofa with what looks like a dingy jacket draped on
    top of it. You glance forward and suddenly realize that somehow you've been
    here before, and that what you see seems weirdly familiar: there's a desk on
    the northeast corner of the room, on which a digital clock is blinking with its
    eerie blue light: '3am...October 12th...'. Beside the clock is also a dusty
    picture, of a beautiful lady and a cute little girl... but who are they?"
      ;;
    corridor ) echo "There's no one but you. The dim lights seem to flicker with a
    constant rhythm, as if trying to tell you something. The pipes that line the
    curved walls all seem to lead towards the same direction... which way will
    you go?"
      ;;
    engineRoom ) echo "There's not much here, except for a large engine that is
    not working... and silence..."
      ;;
    periscopeRoom ) echo "You realize that the 'advanced technology' that line the
    walls are actually panels of instruments. There's a display that signals
    depth, level of oxygen, hull pressue, and another indicating the number of
    torpedos and nuclear warheads left onboard, and a radar ominously scanning
    the surrounding area"
      ;;
    timeMachineRoom ) echo "You're still uncomfortable with the subtle buzz in
    the room, but you can't quite place where it is coming from. Sanning the room
    you find a single raised platform in the middle of the room. Perched
    on top fo the platform is a shiny helmet."
      ;;
    timeMachineRoomOutside ) echo "Behind you is the eerily long corridor, and in front of
    you is a heaviest door you've ever seen in your life. You really want to go
    back the way you came. There must be a way to open this darn door";
      ;;
    armory ) echo "lining the walls are rows and rows of guns, grenades, and weapons.
    But they seem to be locked behind a metal cage, which you can't seem to open."
      ;;
    codeRoom ) echo "You turn on the lights, and behold! This is large room that
    looks like it will fit an entire team of commanders.... wait what commanders?
    Have you been here before and what did you do here? The radar, panel of instruments,
    buttons and knobs seem so familiar, as if you were just here 2 days ago. You see
    a screen with the words 'HIT confirmed' flashing obnoxiously in red, and a map
    with the US cities Los Angeles, New York and Chicago circled."

    if ! $(inventoryContains "keycard");
    then
      echo "You see a KeyCard laying in the table, and wonder what it is used for.";
    fi
      ;;

    * ) echo "error: currentLocation $currLocation is not valid"
      ;;
  esac
}



# ##############################################################################
# Function to inspect an inventory item.
# ##############################################################################
function inspectItem {
  # First checks if the item is in your inventory. Helmet can be inspected directly
  # and does not need to be in your inventory.
  if [[ $1 != "helmet" && $(grep -oi $1 inventory | wc -l) -eq 0 ]];
  then
    echo "you do not have '$1' in your inventory. Get '$1' first to inspect it"; return;
  fi

  # if the inventory item is found, then print appropriate message
  case $1 in
    [Jj]acket ) echo "The jacket looks almost military. On the sholder there seems
    be a musty green colored insignia with three golden stars. The insignia looks
    vaguely familiar, as if you had seen it some where in the academy... what academy??
    were you once a soldier? On the chest are
    printed the mysterious words 'Kerensky I – Issac Assimov, submarine combat
    division.'"
    if ! $(inventoryContains "key");
    then
      echo "There also seems to be an object in the pocket...";
    fi
      ;;
    [Hh]elmet ) echo "The helmet looks like an ordinary motorcycle helmet, but it
    is somehow heavier and lighter at the same time, as if its weight changes
    with time. As you hold it in your hands, the buzzing noise gets louder and louder,
    but it is not uncomfortable. You wonder if you should put it on"
      ;;
    [Kk]ey ) echo "This key looks ancient. Perhaps it's used to open a special door
    of some kind?"
      ;;
    [Kk]ey[Cc]ard ) echo "You look closer at the keycard and realize your name is on it
    'Kerensky Alexiaminov'...security clearance level 'most secret'. You member using it
    somewhere..."
      ;;
    [Cc]lock ) echo "The clock looks like an ordinary clock...except for some reason
    the second hand seems to be moving slower than usual?"
    ;;
    [Pp]icture ) echo "The lady and girl in the picture smile warmly at you, waving their
    hands as if saying hello"
    ;;
    * ) echo "unable to inspect $1"
      ;;
  esac

}

# ##############################################################################
## Adds a valid item to your inventory.
# ##############################################################################
function getItem {
  # If already have item in inventory cannot get it again.
  if [[ $(grep -oi $1 inventory | wc -l) -ne 0 ]];
  then
    echo "you already have $1. Cannot get it again"; return;
  fi

  case $1 in
    [Jj]acket )
        if [[ $currLocation == room ]];
        then
          echo "jacket obtained and stored in inventory. You can now wear $1 or inspect $1";
          echo 'jacket' >> inventory;
        else
          echo "There is no $1 in this location";
        fi
      ;;

    [Oo]bject )
      if [[ $(grep -oi jacket wearing | wc -l) -ne 0 ]];
      then
        if ! $(inventoryContains "key");
        then
          echo "The mysterious object in the jacket turned out to be a key and is now stored in your inventory.
          You can now use key or inspect key."
          echo 'key' >> inventory;
        else echo "you already have the key. Cannot get it again."
        fi
      else
        echo "you cannot get the object without wearing the jacket"
      fi
      ;;

    [Hh]elmet )
      if [[ $location != timeMachineRoom ]];
      then
        echo "there is no helmet around";
      else
        echo "You cannot get the helmet and put it in your inventory. But while you are here, you can inspect $1 or wear $1."
      fi
      ;;

    [Kk]ey[Cc]ard )
      if [[ $currLocation == codeRoom ]]; then
        echo "keycard is now added to your inventory. You can now inspect $1 or use $1"
        echo 'keycard' >> inventory;
      else
        echo "there item $1 does not exist in this location."
      fi
      ;;

    [Cc]lock )
      if [[ $currLocation == room ]]; then
        echo "The clock is now added to your inventory. You can now inspect $1 or use $1"
        echo 'clock' >> inventory
      else
        echo "the item $1 does not exist in this location."
      fi
      ;;

    [Pp]icture )
    if [[ $currLocation == room ]]; then
      echo "The picture is now added to your inventory. You can't explain it, but
      somehow having the picture close to you is comforting... makes it...almost feel like home."
      echo 'picture' >> inventory
    else
      echo "the item $1 does not exist in this location."
    fi
      ;;

    * ) echo "Good try, but you can't get $1";
  esac
}

## Helper function to add an item to your inventory.
function addToInventory {
  if [[ $(grep -oi $1 inventory | wc -l) -ne 0 ]];
  then
    echo "you already have $1 in your inventory. Cannot add it again"; return;
  else
    echo $1 >> inventory
  fi
}

## Helper function to remove an item from your inventory, that is, use sed to
# replace the input batter with a blank string.
function removeFromInventory {
  if [[ $(grep -oi $1 inventory | wc -l) -eq 0 ]];
  then
    echo "You do not have $1 in your inventory. Cannot remove."; return;
  else

    ## FIXME: THIS sed is NOT compatible with GNU linux. sed's i flag on mac is not
    # portable to other linux distibutions
    sed -i.bak "/^$1$/d" ./inventory
    echo "$1 has been removed from your inventory"
  fi
}

## Function to check if inventory contains an item.
function inventoryContains {
  if [[ $(grep -oi $1 inventory | wc -l) -ne 0 ]]; then return 0; else return 1; fi
}
#
# ##############################################################################
# Use a specific item in your inventory
# ##############################################################################
function useItem {
  # If you don't the specified item in your inventory you cannot use it
  if [[ $(grep -oi $1 inventory | wc -l) -eq 0 ]];
  then
    echo "you do not have item '$1' in your inventory so you cannot use it"; return;
  fi

  case $1 in
    [Kk]ey )
      if [[ $currLocation != timeMachineRoomOutside ]]
      then
        echo 'there is no use for a key here.'
      else
        echo 'you insert the key into the heavy door and you hear a click, as
        if some latch has been unlocked.'
        # if all the locks on timeMachineRoom have been unlocked, then print an
        # appropriate welcome message.
        numberLocksLeft=$((numberLocksLeft-1))
        removeFromInventory 'key'
        if [[ numberLocksLeft -eq 0 ]];
        then
          echo "as the lock falls away, you wonder if this mysterious heavy door has finally been unlocked";
        else echo "hm. maybe something else is required."
        fi
      fi
      ;;

      ## IDEA: Make it more fun so the player has to use the keycard Immediately after
      # the key. Will this be too hard?
    [Kk]ey[Cc]ard ) echo "todo"
      if [[ $currLocation != timeMachineRoomOutside ]]
      then
        echo 'there is no use for a keycard here.'
      else
        echo "you look around and find a hidden keypad with patterns on it. you
        swipe. No luck the first time. You do it again. Green light. Something
        must've worked:"
        # if all the locks on timeMachineRoom have been unlocked, then print an
        # appropriate welcome message.
        numberLocksLeft=$((numberLocksLeft-1))
        removeFromInventory 'keycard'
        if [[ numberLocksLeft -eq 0 ]];
        then
          echo "along with the green light, you hear the faint sound of geras moving
          you wonder if this mysterious heavy door has finally been unlocked";
        else echo "hm. maybe something else is required."
        fi
      fi
      ;;
    [Cc]lock ) echo "todo"
      ## TODO: USE CLOCK: After implementing the time machine room need to add this functionality.
      ;;
    * ) echo "cannot use item"
      ;;
  esac
}

# ##############################################################################
# Wear either a helmet or the jacket
# ##############################################################################
function wearItem {
  case $1 in
    jacket )
      if [[ $(grep -oi jacket inventory | wc -l) -eq 0 ]];
      then
        echo "you cannot wear a jacket because you don't have a jacket"
      else
        echo "you are now wearing your jacket"
        echo "jacket" >> wearing;
      fi
      ;;

    helmet )
      if [[ $location != timeMachineRoom ]];
      then
        echo "there is no helmet in your current location"
      else
        ## TODO: What happens after you wear the helmet??
        ## TODO: If the player does not have an alarm clock, then the player is
        # dead. Otherwise, prompt the player to use the alarm clock to slow down time.
        echo "you are now wearing the helmet. You feel a gush of energy..."
        echo "helmet" >> wearing;
      fi
    ;;
    *) echo "You cannot wear $1"
    ;;
  esac

}
################################################################################
# Overarching logic of the game. See above helper functions for specific
# implementation of what happens in each stage of the game
# ##############################################################################

# Prints the welcome message to the user. The initiall location is the room.
echo $spacer
echo "$welcomeMessage"

# resets the inventory text file
# Possible inventory items: Jacket, Key, Clock, KeyCard
> inventory

# resets what items the users have worn.
# Possible equipment: jacket and helmet
> wearing

while true; do
  read -p ">>>>>> " verb object
  case $verb in
      # Handles to GO <Location> case
      [Gg]o ) if [[ -z "${object// }" ]]; then echo  "usage: go <direction>"; else goto $object; fi
      ;;

      # Handles the LOOK case
      [Ll]ook ) lookaround $object;
      ;;

      # Handles the INSPECT <inventoryItem> case
      [Ii]nspect ) if [[ -z "${object// }" ]]; then echo  "usage: inspect <inventoryItem>"; else inspectItem $object; fi;
      ;;

      # Handles GET <element> case
      [Gg]et ) if [[ -z "${object// }" ]]; then echo  "usage: get <item>"; else getItem $object; fi;
      ;;

      # Handles the QUIT case
      [Qq]uit ) echo "thanks for playing"; exit 0;
      ;;

      # Use this command to display inventory items.
      [Ii]nventory )
        if [[ ! -s inventory ]];
        then
          echo "you don't have items in your inventory";
        else
          echo $spacer
          echo "YOUR INVENTORY ITEMS: ('use', 'inspect', or 'wear')"
          cat inventory;
          echo $spacer
        fi
      ;;

      # Use this command to display inventory items.
      [Ww]earing )
        if [[ ! -s wearing ]];
        then
          echo "you are currently not wearing any items";
        else
          echo $spacer
          echo "YOU ARE WEARING:"
          cat wearing;
          echo $spacer
        fi
      ;;

      # Handles the USE case. i.e.: Use an inventory item
      [Uu]se ) if [[ -z "${object// }" ]]; then echo  "usage: use <inventoryItem>"; else useItem $object; fi;
      ;;

      # Handles the WEAR case. i.e.: Wear a wearable inventory item
      [Ww]ear ) if [[ -z "${object// }" ]]; then echo  "usage: wear <inventoryItem>"; else wearItem $object; fi;
      ;;
      [Hh]elp ) displayHelp
      ;;
      [Ll]ocation ) echo $currLocation
      ;;
      [Ll]ocks ) echo $numberLocksLeft
      ;;
      [Cc]heat )
        addToInventory "picture"
        addToInventory "key"
        addToInventory "keycard"
        addToInventory "clock"
        addToInventory "jacket"
        echo "jacket" >> wearing
        currLocation=timeMachineRoomOutside
        ;;
      # Anything else is treated as an invalid command.
      *) echo "invalid command"
      ;;
  esac
done
