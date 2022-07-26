This repo clones the original https://github.com/umami-software/umami and build an image with:

- DATABASE_TYPE: postgresql
- BASE_PATH: /analytics
- DISABLE_TELEMETRY: 1

## Usage
Run `./build.sh vXX.XX.XX` for build the image and then push images `docker push xjrcode/umami_analytics --all-tags`
