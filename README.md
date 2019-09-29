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
