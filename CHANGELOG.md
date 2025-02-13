# 2.2.1

- fix missing handler on message update for `failed` message status

# 2.2.0

- added message status `failed`

# 2.1.1

- bugfix using the wrong message type when generating message reply

# 2.1.0

- added support for message with reply type

# 2.0.12

- fix not saving latest message id when loading room and getting new message

# 2.0.11

- fix missed errors

# 2.0.10

- fix not sending `extras` data when creating room

# 2.0.9

- fix error or infinite loading when not connected to realtime server

# 2.0.8

- fix can not delete messages

# 2.0.7

- fix Bad Stream State on room cleared event

# 2.0.6

- fix throwing errors on certain method when not connection
  to realtime services

# 2.0.5

- change mqtt client id format
- fix opening & closing realtime connection manually

# 2.0.4

- remove wait on all method when not authenticated

# 2.0.3

- fix not sending user typing events

# 2.0.2

- fix could not send `clearMessagesByChatRoomId` and `deleteMessages`
- fix not saving synchronize `lastMessageId` and `lastEventId`
- implement sending `markAsDelivered` when receiving message
- implement `hashCode` and `toString` to some model

# 2.0.1

- fix unable to listen more than once on realtime events

# 2.0.0

- upgrade dependencies to use the stable version
- fix wrong message timestamp

# 2.0.0-beta.7

- implemented wether sync event should run or not based on app config

# 2.0.0-beta.6

- fix could not delete message

# 2.0.0-beta.5

- fix synchronize and synchronize event not running in background

# 2.0.0-beta.4

- fix not receiving incomming message

# 2.0.0-beta.3

- fix error when not connected to mqtt

# 2.0.0-beta.1

- introducing nullsafety
- removed all methods postfixed with `$`
- all methods now return Future or a Stream instead of using callback
  excluding `upload` and `sendFileMessage` as it is returing either
  an error, progress, and success result

# 1.0.18

- fix error on appconfig failing `setup` process
- fix not sending ajax request after updating to dio 4.0
- [internal] support for generating `AppConfig` from `Storage`
- updating some dependencies to the latest version and removing the least
  used dependencies
  - mqtt_client: ^6.0.0 -> ^9.4.2
  - dio: ^3.0.8 -> ^4.0.0
  - equatable: ^1.1.1 -> ^2.0.3
  - get_it: ^4.0.2 -> ^7.0.0
  - async: ^2.4.1 -> ^2.5.0
  - meta: removed

# 1.0.17

- Make `roomIds` parameter not required on `getFileList`
- Add include and exclude extension on `getFileList` method

# 1.0.14

- improve `setUser` method to allow for setting user
  even when realtime server aren't stable

# 1.0.13

- provide "FLUTTER_NOTIFICATION_CLICK" when getting push notifications from
  firebase

# 1.0.12

- fix not reconnecting to mqtt server after losing internet connection

# 1.0.11

- fix not connecting to mqtt when using `setUserWithIdentityToken` as authentication method

# 1.0.10

- fix not decoding emoji correctly when receiving message containing emoji

# 1.0.9

- add update message feature
- fix not getting mqtt event after calling `clearUser` and then `setUser`

# 1.0.8

- fix not calling callback on successful operation
- fix error when publishing mqtt event while mqtt still connecting
- fix not subscribing to message delete event
- fix still reconnecting when user already logged out

# 1.0.8-beta.2

- fix not calling callback on successful operation

# 1.0.8-beta.1

- fix error when publishing mqtt event while mqtt still connecting
- fix not subscribing to message delete event
- fix still reconnecting when user already logged out

# 1.0.7

- fix error when deleting message and clearing room
- fix not subscribing to mqtt event when it is still
  in connecting state
- fix sending empty json on some api request

# 1.0.7-beta.2

- fix keep on sending empty json

# 1.0.7-beta.1

- fix error when deleting message and clearing room
- fix not subscribing to mqtt event when it is still
  in connecting state

# 1.0.6

- fix can not connect to mqtt broker

# 1.0.5

- fix not stringified extras when creating room

# 1.0.4

- fix not parsing correct last event id
- fix missing implementation of room message cleared
- fix error while parsing `extras` and `payload`

# 1.0.3-dev.1

- trying to make this package compatible with dartjs

# 1.0.3-dev.1

- fix not using utc time when parsing timestamp
- another interval improvement

# 1.0.3

- Fix broken changes leftover

# 1.0.2

- Fix not sending the correct format of extras data for some API

# 1.0.2-dev.1

- fix not using utc time when parsing timestamp
- another interval improvement

# 1.0.1

- Nothing new
- No bugfix
- No improvement
- Just to make sure, the intended version are picked as latest by pub.dev

# 1.0.0

- Stable release
- fix not getting new message through sync service
  when mqtt are not connected
- fix error when getting room info
- fix error while listening to new message multiple times

## 1.0.0+beta5

- refactor some code
- other small improvement

## 1.0.0+beta4

- fix missing injected library (internal)
- fix missing `lastMessage` on `getRoomWithMessages` response
- QoL remove some unneeded method
- Improve some `toString` method for easier log reading
- Make a workaround for not subscribing to mqtt after successfully login

## 1.0.0+beta3

- fix not getting extras data for `QChatRoom`
- fix not using the right version number in ajax request headers

## 1.0.0+beta2

- fix cannot connect to broker server after
  getting new server from load balancer
- fix not stopping sync from running after logout / user
  are cleared
- fix error when clearing user
- migrating dart specific features into an extensions
- use a new object of Error instead of general Exception object
  for error generated by qiscus sdk

## 1.0.0+beta1

- Fix sdk not usable for multiple appId
- Fix not using appId as mqtt id
- Fix not making message as delivered when received
- Fix not able to send generated custom message

## 1.0.0+alpha6

- Fix cannot get user data
- Fix cannot determine if room are single, group, or channel
- Add more method which return Future

## 1.0.0+alpha5

- Fix not subscribing to new message

## 1.0.0+alpha4

- Fix not handling error on future `onError` handler

## 1.0.0+alpha3

- Add some method which will return a future instead of using callback
- Fix not using broker url from provided value
- Add generate message method helpers
- Fix last message always empty on room object
- Internal refactoring

## 1.0.0+alpha2

- Fix not sending the correct appId

## 1.0.0+alpha1

- Initial version
