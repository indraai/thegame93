/*
************************************************************************
*  File: events.doc *
* *
*  Usage: An explanation of how to use mud events *
*  Written by Joseph Arnusch (Vatiken) (Joseph.Arnusch@gmail.com) *
*
*  Usage: An explanation of how to use events *
*  Written by Eric Green (ejg3@cornell.edu) *
************************************************************************
*/

Vatiken's MUD event system
--------------------------

Table of Contents
-----------------
1.  Purpose
2.  Functions Related to MUD Events
3.  Steps to Create a New MUD Event
4.  Differences between the two systems

1. PURPOSE

I scribed a "MUD" event system using the "Death Gate Event" system already
in place to allow for increased ease, and maintainability for both rookie
and experienced programmers.

2. FUNCTIONS RELATED TO MUD EVENTS

 a) See EVENTFUNC() in the Death Gate Events documentation below
 b) void init_events(void)
    "init_events()" creates the global events list and is the allocated location
    for placing any global events, these may include things like AI, Weather,
    and Combat.
 c) struct mud_event_data * char_has_mud_event(struct char_data * ch, event_id iId)
    "char_has_mud_event()" returns an event in the characters event list that matches
    the supplied "event_id", or NULL if none exists.
 d) NEW_EVENT(event_id, struct, var, time)
    "NEW_EVENT" creates a new event of the "event_id" type, with the supplied structure
    (ch, desc, object, etc..), any addtional "var"s, and is set to activate in
    this amount of "time".
 e) struct mud_event_list[]
    The mud_event_list[] is an array of all the events you've designed into your MUD.
    The reason for this excessive step is primarily for organization and troubleshooting,
    and it takes a mere couple seconds to add to mud_events.c.

3. STEPS TO CREATE A NEW MUD EVENT

 a) Add the new event_id to enum list in mud_events.h

  typedef enum {
    eNULL,
    ePROTOCOLS, /* The Protocol Detection Event */
    eWHIRLWIND, /* The Whirlwind Attack */

    eNEWEVENT   /* A NEW EVENT */
  } event_id;

 b) Create the event

  EVENTFUNC(new_event)
  {
    struct char_data *ch, *tch;
    struct mud_event_data *pMudEvent;
    struct list_data *room_list;
    int count;

    /* This is just a dummy check, but we'll do it anyway */
    if (event_obj == NULL)
      return 0;

    ...

    return 0;
  }

 c) Add the event_id data to mud_event_list[]

  struct mud_event_list mud_event_index[] = {
    { "Null"         , NULL           , -1          },  /* eNULL */
    { "Protocol"     , get_protocols  , EVENT_DESC  },  /* ePROTOCOLS */
    { "Whirlwind"    , event_whirlwind, EVENT_CHAR  }   /* eWHIRLWIND */

    { "A New Event"  , new_event      , EVENT_CHAR  }   /* eNEWEVENT */
  };

 d) Place a call for the new event

  if (variableX > variableY)
    NEW_EVENT(eNEWEVENT, ch, NULL, 60 * PASSES_PER_SEC);

 e) Sit back and enjoy your event triggering in 60 seconds.

4. DIFFERENCES BETWEEN THE TWO SYSTEMS

The biggest differences between the two systems is that the MUD Event System
employs certain functions to make it more "dummy proof" without limiting
functionality.

For example:
 a) all memory allocated for a MUD event will be freed when the event
    is no longer in use.
 b) the mud_event_index[] can/will log when events are called, allowing for an
    easy way to debug any problems.
 c) the mud_event structure allows for easy handling of memory that shouldn't
    be freed with the event like the character him/herself.
 d) when a character leaves the game, all mud_events will be cleared without
    manually having to place checks in free_char().

The "MUD Event" system should be adequate for 99% of all events that a developer
may be interested in creating, and still allows access the dg_event event system
for anything requiring more complicated procedures.

========================================================================

  		  Death Gate Events


Table of Contents
-----------------
1.  Event Functions and Event Objects
2.  Functions for Manipulating Events
3.  Steps to Create a New Event Type
4.  An Example Event Type
5.  Tips for Create Events

-----------------------------------------------------------------------------
1.  Event Functions and Event Objects


Each event type needs an:

  Event function:

    An event function is a function with a prototype of:

        long (event_function)(void *event_obj)

    This function is called when the event occurs, and is passed the event
    object (see below).  If the function returns a positive value, the event
    is reenqueued using the return value as the number of pulses in the
    future the event will reoccur.  If the function returns 0 or a negative
    number, the event is not reenqueued.  If the event is not to be
    reenqueued, the event function is responsible for freeing the event
    object.  There is a define:

        #define EVENTFUNC(name) long (name)(void *event_obj)

    to be used when declaring an event function.

  Event object:

    The event object is any structure with the fields to store any data
    needed by the event function.  The event object should not be a game
    object (such as a struct char_data), since this object is freed when
    events are canceled (see cancel_event() below).  All unique data
    contained by the object should be freed by a call of free(event_obj).
    In other words, don't have event_obj include pointers to other structures
    which aren't pointed to elsewhere.  It is also not advisable to have
    pointers in the event object unless the thing they point to has a pointer
    to this event and cancels the event when it is freed.  Passing NULL as an
    event object is valid (providing the event function doesn't need any
    data).

----------------------------------------------------------------------------
2.  Functions for Manipulating Events


The prototypes for the interface functions for events are provided in
events.h.  They are:

void event_init(void);
    This function initializes the event queue for all events.  It is only
    called once, at the initialization of the game.

struct event *event_create(EVENTFUNC(*func), void *event_obj, long when);
    This function creates a new event.  At the current time plus 'when',
    the function call

    func(event_obj);

    will be made.  A pointer to the created event is returned.  Never free()
  the event returned.  Use event_cancel instead if you want to get rid of it
  prematurely.

void event_cancel(struct event *event);
    This function cancels an event currently in the queue.  The event and the
    event_obj are freed by this call.

void event_process(void);
    This function is called once each pulse to process any pending events.
    It should not be used outside of the main loop.

long event_time(struct event *event);
    Given event, this function returns the number of pulses until the event
    occurs.  One example of a place it is used is to get the pulses left before
    an object timer expires, so its current state can be saved and restored
    later.

-----------------------------------------------------------------------------
3.  Steps to Create a New Event Type

To add a new event type, you do not need to know anything about what's in
events.c, queue.c, or queue.h, the core of the event code.  To create an
event type:

  1.  Declare an event object structure.

  2.  Create your event function.

  3.  Construct your event object, and call event_create() where needed.

  4.  Any place that the 'owner' of the event can be destroyed, call
      event_cancel().

------------------------------------------------------------------------------
4.  An Example Event Type


Example event type:

  /* the event object for the sniff event */
  struct sniff_event_obj {
      struct char_data *ch;
      byte type;
  };


  EVENTFUNC(sniff_event)
  {
    struct sniff_event_obj *seo = (struct sniff_event_obj *) event_obj;
    struct char_data *ch, *victim;

    ch = seo->ch;

    GET_CHAR_SNIFF(ch) = NULL;

    if (type == SNIFF_COLD)
      act("$n sniffs loudly.", FALSE, ch, NULL, NULL, TO_ROOM);
    else
      act("$n sniffs some cocaine.", FALSE, ch, NULL, NULL, TO_ROOM);

    act("You sniff.", FALSE, ch, NULL, NULL, TO_CHAR);

    if (--seo->severity <= 0) {
      /* we're done with sniffing */
        free(event_obj);
    }
    else
      return PULSE_SNIFF;
  }


  ACMD(do_sniff)
  {
    struct sniff_event_obj *sniff;

    CREATE(sniff, struct sniff_event_obj, 1);
    sniff->ch = ch;
    sniff->severity = 5;
    if (GET_CLASS(ch) != CLASS_SARYA)
      sniff->type = SNIFF_COLD;
    else
      sniff->type = SNIFF_COCAINE;

    GET_CHAR_SNIFF(ch) = event_create(sniff_event, sniff, PULSE_SNIFF);

    send_to_char(OK, ch);
  }


  void extract_char(struct char_data *ch)
  {

    ...

    if (GET_CHAR_SNIFF(ch)) {
      event_cancel(GET_CHAR_SNIFF(ch));
      GET_CHAR_SNIFF(ch) = NULL;
    }

    ...
  }

-----------------------------------------------------------------------------
5.  Tips for Create Events


Tips for creating events:

 o event_obj should always be freed (or reused) in the EVENTFUNC()

 o Any game object pointed to by event_obj should have a pointer to the
   the event so it can cancel the event if it is extracted.

 o Any game object with pointers to an event should have the event pointer
   set to NULL in EVENTFUNC and immediately following event_cancel().

 o Any place a game object is extracted from the game, any events it points to
   should be canceled and its pointer to the events set to NULL.
