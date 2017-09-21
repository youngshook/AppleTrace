# AppleTrace
Trace tool for iOS/macOS

`AppleTrace` is developed for analyzing app's performance on `iOS/macOS`.

![sample](image/sample.png)

## Feature

1. User-defined trace section.
2. **[arm64 only]** Trace all Objective C methods.

## Usage

1. Produce trace data.
2. Copy from app's sandbox directory.
3. Merge (all) trace data files into one file `trace.json`. (There may be more than 1 trace file.)
4. Generate `trace.html` based on `trace.json`.

See below for more detail.

### 1. Produce


Until now , there are 2 ways for generating trace data.

1. Manual set section.

	Call `APTBeginSection` at the beginning of method ,and `APTEndSection` at the end of method. For Objective C method (whether instance method or class method), there are `APTBegin` and `APTEnd` macro for easy coding.
	
	```
	void anyKindsOfMethod{
	    APTBeginSection("process");
	    // some code
	    APTEndSection("process");
	}
	
	- (void)anyObjectiveCMethod{
	    APTBegin;
	    // some code
	    APTEnd;
	}
	```
	
	Sample app is `sample/ManualSectionDemo`.
	
2. Dynamic library hooking all objc_msgSend.

	Hooking all objc_msgSend methods (based on HookZz). This only support arm64.
	
	Sample app is `sample/TraceAllMsgDemo`.

### 2. Copy

Using any kinds of method, copy `<app's sandbox>/tmp/appletracedata` out of Simulator/RealDevice.

![appletracedata](image/appletracedata.png)


### 3. Merge

Merge/Preprocess the `appletracedata`.

```
python merge.py -d <appletracedata directory>
```

This will produce `trace.json` in appletracedata directory.

### 4. Generate

Generate `trace.html` using `catapult`.

```
python catapult/tracing/bin/trace2html appletracedata/trace.json --output=appletracedata/trace.html

open trace.html
```

## SampleData

Open `sampledata/trace.html`.


## Dependencies

1. [catapult](https://github.com/catapult-project/catapult)
2. [HookZz](https://github.com/jmpews/HookZz)



## Develop Plan

1. dtrace as data source.