# 8033 FRC Scouting for 2022

## TODO
Barry
- QR Code Scanning for Presets
   - ~~Create scanner screen that can scan qr codes and return values~~
   - QR Tokens need to be created and deserializable, json is probably easiest
- Create Presets Class
- ~~save data to JSON file on disk, even if closed app~~
- Fix the login screen
   - ~~Implement QR token scanner as part of login system~~
   - Make a dev testing autofill and skip button
   - ~~Get rid of 'Login without internet" button~~

Jacob
- Come up with a better design than three buttons on the bottom (move to top?)
   - Test UI on iPhone devices
   - Remove borders around game screen
   - Verify with Apple HIG and other restrictions
- Robot broke into modifier
- Convert to Template app
- Open Previous JSON files as QR codes

### FUTURE
- Custom Serializer
- Switch from JSON to Custom Schema
- Come up with a way to self-describe game-specific data
- Better adapt Game Screen to larger aspect ratios - like the iPad Pro (12.9 inch) for example
