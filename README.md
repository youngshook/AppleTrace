# ostrace
*OS Trace for iOS/macOS (`*OS` stands for `iOS/macOS`)

`ostrace` is mainly for `iOS/macOS`, similar to `systrace` for `Android`.

![sample](sample.png)

## Feature

1. User-defined trace section.
2. Trace all Objective C methods.

## Usage

Until now , there are 2 ways using `ostrace`.

1. Manual set section.
2. Dynamic library hooking all objc_msgSend.



## Develop Plan

1. dtrace as data source.

## Thanks

1. catapult
2. HookZz