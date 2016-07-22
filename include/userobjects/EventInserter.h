/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef EVENTINSERTER_H
#define EVENTINSERTER_H

#include "GeneralUserObject.h"
#include "RandomInterface.h"
#include "RandomPointUserObject.h"

class EventInserter;

template<>
InputParameters validParams<EventInserter>();

/**
 * This UserObject manages the insertion and timing of events in the simulation
 * domain. It manages a list of events with their insertion times and their center
 * positions.
 */
class EventInserter :
  public GeneralUserObject,
  public RandomInterface
{
public:
  EventInserter(const InputParameters & parameters);

  virtual void initialize(){} // Not used
  virtual void execute();
  virtual void finalize(){} // Not used

  /// An event has an start time and a location
  typedef std::pair<Real, Point> Event;

  /// A list of future time/location pairs
  typedef std::vector<Event> EventList;

  /// Get the event list
  const EventList & getEventList() const { return _global_event_list; }

  /// Get the old event list
  const EventList & getOldEventList() const { return _old_event_list; }

  /// Get time tolerance
  const Real & getTimeTolerance() const { return _time_tol; }

  /// Get old event tracking flag
  const bool & areOldEventsBeingTracked() const { return _track_old_events; }

  /// Get old event removed flag
  const bool & wasOldEventRemoved() const { return _old_event_removed; }

  /// Calculate time to next event
  Real getNewEventInterval();

  /// Check if event is available between the two supplied times
  bool isEventActive(const Real t1, const Real t2) const;

  /// Return event between the two supplied times
  Point getActiveEventPoint(const Real t1, const Real t2) const;

  /// Returns time of next event in list
  Real getNextEventTime() const;

  /// Returns time of last event in list
  Real getMaxEventTime() const;

protected:
  /// Timing to use between event
  const bool _use_random_timing;

  /// Type of probability distribution to use for picking next event time
  const MooseEnum _distribution;

  /// Mean value of probability distribution
  const Real _mean;

  /// Flag to add an event at the beginning of the simulation
  bool _insert_initial;

  /// Flag to add an extra event at user-specified time and place
  bool _insert_test;

  /// Time to insert test event
  Real _test_time;

  /// Location of test event
  Point _test_location;

  /// Reference to RandomPointUserObject
  const RandomPointUserObject & _random_point_user_object;

  /// Random number seed
  const unsigned int _seed;

  /// Verbose flag
  const bool _verbose;

  /// Tolerance when comparing times
  const Real _time_tol;

  /// Flag to track old events
  const bool _track_old_events;

  /// How to choose when old events should be removed from list
  const MooseEnum _removal_method;

  /// Age at which to expire an old event
  const Real _removal_time;

  /// Target Event sigma value to remove old event
  const Real _removal_sigma;

  /// Flag when Event has been removed from old list
  bool _old_event_removed;

  /// Flag to insert the first event
  bool _insert_first;

  /// Flag to insert the second event
  bool _insert_second;

  /// the global list of all events
  EventList _global_event_list;

  /// List of old events
  EventList _old_event_list;

  /// List of old events from previous time step
  EventList _older_event_list;
};

#endif //EVENTINSERTER_H