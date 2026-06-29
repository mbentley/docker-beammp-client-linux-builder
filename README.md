# docker-beammp-linux-builder

This is a Docker image with all of the necessary build tools to build the [BeamMP](https://docs.beammp.com/game/getting-started/#2b-linux-installation) Launcher (client) for Linux.

## Building

Building the image is straight forward:

```bash
docker build \
  --pull \
  --progress plain \
  -t mbentley/beammp-linux-builder .
```

## Usage

You can directly call the build script (which is the image's default command):

```bash
docker run -it --rm -v /path/to/temp/build/directory:/build mbentley/beammp-linux-builder
```

Or run this interactively in a shell:

```bash
docker run -it --rm -v /path/to/temp/build/directory:/build mbentley/beammp-linux-builder bash

/build.sh
```

## Running

Once built, the binary `BeamMP-Launcher` should be in wherever you set the placeholder value of `/path/to/temp/build/directory` to.  Within that directory, it will be found at `BeamMP-Launcher/bin/BeamMP-Launcher`. Follow the instructions for moving the finished application into it's own folder to run found in the [official documentation](https://docs.beammp.com/game/getting-started/#2b-linux-installation).
