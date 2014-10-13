$(document).on('ready page:load', function () {
  showCalendar();
});

function showCalendar() {
  $('.view-calendar').on('click', function() {
    $('#calendar').fadeIn(2000);
    fetchCalendar();
    $('.view-calendar').unbind();
    addRemoveCalendarBtn();
  });
}

function addRemoveCalendarBtn() {
  $('#schedule-control').removeClass('view-calendar');
  $('#schedule-control').addClass('hide-calendar');
  $('#schedule-control').text('Hide schedule');
  clearCalendar();
}

function addViewCalendarBtn() {
  $('#schedule-control').removeClass('hide-calendar');
  $('#schedule-control').addClass('view-calendar');
  $('#schedule-control').text('View our current schedule');
  showCalendar();
}

function fetchCalendar() {
  $('#calendar').fullCalendar({
    eventSources: [
      {
        url: 'https://www.google.com/calendar/feeds/4dahvsn39nbms77s9i5njidt9g%40group.calendar.google.com/public/basic',
        dataType: 'gcal'
      }
    ]
  });
}

function clearCalendar() {
  $('.hide-calendar').on('click', function(e) {
    e.stopPropagation();
    $('#calendar').slideUp();
    $('#calendar').empty();
    addViewCalendarBtn();
  });
}
