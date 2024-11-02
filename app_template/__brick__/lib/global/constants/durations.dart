///1/4 a second
const quarterSeconds = Duration(milliseconds: 250);

///1/2 a second
const halfSeconds = Duration(milliseconds: 500);

///3/4 a second
const threeQuarterSeconds = Duration(milliseconds: 750);

///1 second
const oneSecond = Duration(seconds: 1);

///1.5 seconds
const oneAndHalfSeconds = Duration(seconds: 1, milliseconds: 500);

/// 2 Seconds
const twoSeconds = Duration(seconds: 2);

/// splash screen waiting time
const splashScreenWaitingTime = threeSeconds;

/// splash animation duration, 1.5 second less than the splash screen waiting time
const splashAnimationDuration = oneSecond;
// const splashAnimationDuration = oneAndHalfSeconds;

/// 3 Seconds
const threeSeconds = Duration(seconds: 3);

/// validation waiting

///  5 years from now
final fiveYearsFromNow = DateTime.now().add(const Duration(days: 365 * 5));

/// 5 years ago
final fiveYearsAgo = DateTime.now().subtract(const Duration(days: 365 * 5));

/// api call seconds = 6
const apiErrorSeconds = Duration(seconds: 5);
