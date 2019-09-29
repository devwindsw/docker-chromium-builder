# Docker image to build the Chromium

Dockerfile for chromium-builder

## Running

### 1. Create a directory for the Chromium
```
mkdir chromium
```

### 2. Download dept_tools under /chromium
Refer to https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions.md#Install.

```
cd chromium
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
```

### 3. Start a container
```
docker run -it -v /path/to/chromium/you/created/on/local:/chromium --rm chromium-builder
```

### 4. Download the source and build in the container 
Refer to https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions.md#Install.

```
cd /chromium
fetch --nohooks --no-history chromium
cd src
build/install-build-deps.sh
gclient runhooks
gn gen out/Default
autoninja -C out/Default chrome
out/Default/chrome
```

## Chromium for Android
Refer to https://chromium.googlesource.com/chromium/src/+/master/docs/android_build_instructions.md

Do "fetch android" instead of "fetch chromium".

### Converting an existing Linux checkout
If you have an existing Linux checkout, you can add Android support by appending target_os = ['android'] to your .gclient file (in the directory above src):
```
echo "target_os = [ 'android' ]" >> ../.gclient
```
Then run gclient sync to pull the new Android dependencies:
```
gclient sync
```

### Install additional build dependencies
Once you have checked out the code, run
```
build/install-build-deps-android.sh
```

### Setting up the build
Run 
```
gn args out/Default 
```

and edit the file to contain the following arguments:
```
target_os = "android"
target_cpu = "arm64"  # or "arm"
```

### Build
```
autoninja -C out/Default chrome_public_apk
```
