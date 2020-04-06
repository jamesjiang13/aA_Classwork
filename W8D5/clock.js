class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    const date = new Date();

    this.hours =  date.getHours();
    this.minutes =  date.getMinutes();
    this.seconds = date.getSeconds();

    const clock = this;
    this.printTime = this.printTime.bind(clock); // binds printTime to clock, so 'this' will always refer to clock

    this._tick();
  }
  
  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let currentTime = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(currentTime);
    const date = new Date(); // creates new "date" for every second
    this.hours = date.getHours();
    this.minutes =  date.getMinutes();
    this.seconds = date.getSeconds();
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    setInterval(this.printTime, 1000);
  }
}

const clock = new Clock();
// clock.printTime();
