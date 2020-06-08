### Is Zoom kicking you out after 40 minutes?

Not anymore! Reconnecting is as easy as just hitting a shortcut!

![](icon.jpg)

### Make it work for you
To make it work for you, you need to do the following:
- clone this repo somewhere.
- in `script.sh`, change the `FIREFOX_PROFILE` value to your profile, find it by ` ls ~/Library/Application\ Support/Firefox/Profiles`.

To run, either:
- just run the script.
- use the provided `.alfredworkflow` file to add this to Alfred. Don't forget to go to the settings, you can change the default shortcut, I have `fz` by default, and you need to change the path to the script. Change `~/Source/pvinis/i-kick-you-out` to the path where you cloned this repo.
- use any other way, and if you are an awesome human, tell me what you used or make a PR to add that way in this repo!

### Why this exists?
I have to use Zoom all the time for work, and I am so bored to reconnect when a Zoom call kicks us out after the first 40 minutes. They say a good developer is a bored developer, because then you automate things. Here's my attempt.

### How it works
When I connect to a Zoom call, I basically click on the link, it opens on my browser, and that opens the Zoom app.
To reconnect easily, what I do in `script.sh` is basically grabbing the latest `zoom.us/j` url in my browser's history, then open that url, and everything else just happens like normal.

The main components are macOS and Firefox. These two determine the path where I grab the latest url. In my case the path is `~/Library/Application\ Support/Firefox/Profiles/<my-profile>/places.sqlite`.

The script gets that file, copies it to `/tmp/i-kick-you-out/places.sqlite`, so we don't mess with the original file, and runs a query to get the latest url that matches `zoom.us/j`.

Then just removes the `status=success` part of the url, because that stops the browser from opening the Zoom app. It then just opens the url, and we are off! Talking with my collegues in a matter of seconds, and without the need to touch my mouse or find links in my calendar.

A couple of extra things about my setup that you might want to think about using are [finicky](https://github.com/johnste/finicky), which I use for picking which browser to open based on regex on the url, and [Alfred](https://www.alfredapp.com/), which I use to type `fz` to trigger the reconnect script.

This script is kinda specific to my case, but I'm pretty sure it can be worked on a tiny bit to make it more general. I want to put it out there, at least for the many people with a similar setup as me.

### Specific Notes
I noticed that Firefox does not sync history to `places.sqlite` immediately. It usually takes a couple of minutes but it definitely sync more often than 40 minutes, so by the time I'm kicked out of Zoom, the history is synced, and the script will get the right call url.


### Do you have an idea or a setup that is not compatible?
Make an issue! Make a PR! I'm interested!! Thanks.
