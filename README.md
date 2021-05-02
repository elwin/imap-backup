# IMAP Backup
This is a container for the excellent [joeyates/imap-backup](https://github.com/joeyates/imap-backup) ruby gem. Running the container will simply invoke the script to backup all emails and likely terminate thereafter. You should therefore run it periodically to fetch the latest mails. `imap-backup` uses checkpoints to restart after restart and thus will avoid downloading the same mails over and over again.

## Setup
Config file

To generate the config file I recomment you to attach to the container and run the `imap-backup` setup wizard like so:
```bash
$ docker run \
	--interactive \
	--volume /local/path/to/config.json:/root/.imap-backup/config.json \
	ghcr.io/elwin/imap-backup imap-backup setup
```

This will generate a file similar to that:
```json
{
  "accounts": [
    {
      "username": "example@gmail.com",
      "password": "some_password",
      "local_path": "/root/.imap-backup/backup/example_gmail.com",
      "folders": [

      ],
      "server": "imap.gmail.com"
    }
  ],
  "debug": true
}
```

`password` will normally simply be your password, for Gmail you can use OAuth2: Instructions for OAuth2 can be found on the original repo [here](https://github.com/joeyates/imap-backup).

## Run container
To finally run the container, simply run
```bash
 $ docker run \
 	--volume /local/path/to/config.json:/root/.imap-backup/config.json \
 	--volume /local/path/to/data:/root/.imap-backup/backup \
 	ghcr.io/elwin/imap-backup
 ```

 Note that the path of the second volume of the container (here `/root/.imap-backup/backup`) should corresopnd to the path specified in `local_path` in the config file (potentially without the email directory `example_gmail.com` to store data from all accounts, if multiple were specified).