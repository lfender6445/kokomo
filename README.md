kokomo
======

- `curl https://install.meteor.com | /bin/sh` # install meteor
- `npm install -g meteorite` # install mrt package manager
- `mrt` # start server
- `bower install` # install client dependencies

# Links

- auth setup https://console.developers.google.com/

# TODO - Short term

- Add popup options to interact with a user's avatar
  - start voice chat
  - video invite
- Add button to room to automatically invite all room members to Google hangout

- Google Plus
  - join existing hangouts
  - Ensure hangout is launched with signed in account
  - Add anchor tag to user name in chat to open Google hangout with the user
  - Update avatar so it is obvious they are in a hangout session
  - Share camera
  - Share screen
- Voice chat
  - keep it simple like sococo
  - disable listen and talk
  - if video chat is launched, user should be muted on client and voice
    should be handled by g+
- Allow user to go back to room 0
- Logging out should remove avatar from room (this may already be done)

# TODO - long term

- Calendar integration
  - UI updates for active calendar meetings
- FB style 'poke me' notifications
- Code highlighting
- Campfire integration
- gif / media embed support
- ability to lock a room (closed door like sococo)

# Limitations
Limit for a google hangout is 10 for a regular account or 15 for a business account. Hangouts on air can be used to stream a meeting with video, but only 10 people can actively participate, the rest have to watch the stream.
