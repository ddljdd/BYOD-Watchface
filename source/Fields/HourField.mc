using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.System as Sys;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.Activity as Activity;

using Toybox.System as Sys;

class HourField extends Field
{
    function initialize(_settings)
    {
        settings = _settings;
    }

    function draw(loc)
    {
        var hour = Sys.getClockTime().hour;
        if(!Sys.getDeviceSettings().is24Hour && hour >= 12)
        {
        	hour = hour%12;
        }
        var paddingX = (settings.fieldWidth-settings.dc.getTextDimensions(hour.format("%02.f"), Gfx.FONT_NUMBER_THAI_HOT)[0])/2;
        var paddingY = (settings.fieldHeight-settings.dc.getTextDimensions(hour.format("%02.f"), Gfx.FONT_NUMBER_THAI_HOT)[1])/2;
        settings.dc.setColor(settings.foreColor, Gfx.COLOR_TRANSPARENT);
        settings.dc.drawText(settings.fieldXY[loc][0]+paddingX, settings.fieldXY[loc][1]+paddingY, Gfx.FONT_NUMBER_THAI_HOT, hour.format("%02.f"), Gfx.TEXT_JUSTIFY_LEFT);
    }
}
