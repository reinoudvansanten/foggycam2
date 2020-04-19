# 📹 foggycam

A tool to capture Nest video streams locally or to the Azure cloud, even for users without a Nest subscription. The current release is tested on macOS. Windows and Linux adaptations coming soon (minor tweaks required).

>**NOTE:** Audio recording is currently not supported.

## How To Configure

Rename `_config.json` to `config.json` and specify the following parameters:

|Parameter|Description|
|-----|-----|
|`issueToken`|Instructions of how to obtain them are [here](https://github.com/chrisjshull/homebridge-nest#using-a-google-account)<br/><br/> **This will have to be one only once**|
|`cookies`|Same as above |
|`apiKey`|Same as above |
|`path`|Absolute path to local folder where content needs to be stored.<br/><br/>Default is the script path.|
|`frame_rate`|Frame rate for the generated video.<br/><br/>Default is 24.|
|`threshold`|Number of images that need to be combined in a video in a single buffer.<br/><br/>Default is 200.|
|`width`|Image width for the capture image.<br/><br/>Default is 1280.|
|`cam_retry_wait`|Determines how long to wait once the camera has been detected offline.<br/><br/>Default is 60 seconds.|
|`exclude_ids`|Exclude cameras by id<br/><br/>A list of camera ids will be provided at the start of the script<br/><br/>Example: `"exclude_ids":"['l0e5ebdad1a749b9a282a81115aa9c45', '5maa753400d54b7xa78b0fc60b5f0d0d']"`|
|`time_stamp`|Show time and date on top left of the image <br/><br/>Default is false<br/><br/> Requires [download Imagemagic](http://www.imagemagick.org/script/download.php) |
|`clear_images`|Determines whether images are removed after video is produced.<br/><br/>Default is false.|
|`produce_video`|Determines whether a video is generated after a threshold of captured images is hit.<br/><br/>Default is false.<br/><br/>Requires `ffmpeg`, instructions below|
|`upload_to_azure`|Determines whether the final video will be uploaded to Azure Storage.<br/><br/>Default is false.|
|`az_account_name`|Name of the Azure Storage account.|
|`az_sas_token`|SAS token for the Azure Storage account. Should have `write`, `list` and `read` permissions.|


>**NOTE:** Camera labels will be used for directory name if available! 

## How To Start with Docker

Change directory into project
```
cd foggycam2
```

Build Docker image
```
docker build -t foggycam2:latest .
```

Start Docker container
```
docker run -d --name foggcam2 \
    -v [/full/path/to/capture/location]:/usr/local/app/capture/ \
    -v [/full/path/to/your/config/file/config.json]:/usr/local/config.json foggycam2:latest
```
Be sure to replace above the path to recording folder
`[/full/path/to/capture/location]`
and configuration file
`[/full/path/to/your/config/file/config.json]`

## How To Start locally
**`ffmpeg` is required generate video**, [download `ffmpeg`](https://www.ffmpeg.org/download.html) and place it in the `tools` folder, in the script root directory.
**ImageMagic is required to apply timestamp on images** [download ImageMagic](http://www.imagemagick.org/script/download.php) `tools` folder not supported in this case.

Alternatively, if you are on Linux, you can install `ffmpeg` with the help of the following command:

```
sudo apt-get install ffmpeg
```

On macOS, you can install `ffmpeg` through [Homebrew](https://brew.sh):

```
brew install ffmpeg
```

Change directory into project
```
cd foggycam2
```

```
pip3 install -r src/requirements.txt
```

Run `python foggycam2.py` after you configured the settings above. Exit by pressing <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Disclaimer

No claims are made in regards to the stability of the application, or its applicability for your purposes. Use at your own risk. Code is licensed under the [MIT License](https://opensource.org/licenses/MIT). Code can change at any time with no prior notice.

**DO NOT USE** in critical security/surveillance scenarios.

## Troubleshooting

#### Docker file is work in progress

#### Getting `urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]`

On macOS, run  `pip install certifi` and then `/Applications/Python\ 3.6/Install\ Certificates.command`.


## Acknowledgement

Thanks to gboudreau/nest-api for G authentication, and dend/foggycam for the idea + the code for capturing images and video conversion.
