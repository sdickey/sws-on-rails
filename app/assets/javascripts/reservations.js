$(document).ready(function () {
  $('#calendar').fullCalendar({
    eventSources: [
      {
        url: 'https://www.google.com/calendar/feeds/4dahvsn39nbms77s9i5njidt9g%40group.calendar.google.com/public/basic',
        dataType: 'jsonp'
      }
    ]
  });
});





