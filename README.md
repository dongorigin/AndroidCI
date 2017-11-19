# AndroidCI
Android continuous integration sample, use fastlane, hubot.

# [fastlane](https://github.com/fastlane/fastlane)
The easiest way to automate building and releasing your iOS and Android apps. fastlane can connect build tools together, such as gradle, fir.

## example
```ruby
lane :beta do
  gradle(task: "assembleStagingRelease")
  changelog = read_changelog
  fir(changelog: changelog)
  bearychat(text: '@someone App beta updated')
end
```

## common plugins
- [changelog](https://github.com/pajapro/fastlane-plugin-changelog): Automate changes to your project CHANGELOG.md
- [fir](https://github.com/dongorigin/fastlane-plugin-fir): Upload a new build to fir.im
- [bearychat](https://github.com/dongorigin/fastlane-plugin-bearychat): sending messages to a bearychat
