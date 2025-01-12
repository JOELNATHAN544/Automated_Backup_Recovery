## This is an automated backup and recovery exercise in a container
### members of the group
- Nkwenti Severian
- Nyengka Prosper
- Nathan Joel

To achieve this successfully, you need the following :

- clone this repository
- Multipass instance
- Docker container
  
To start you clone this repository in the directory to be tested on your container:
```
git clone https://github.com/Prosper-ador/Automated_Backup_Recovery.git
```

You can install your multipass and run an instance using\
```sh
sudo snap install multipass && multipass launch docker --name ubuntu
```

Now you need to alias **"mulltipass exec ubuntu -- docker"** to **"docker"** in you shell configuration file.

You now run the command
```
docker pull busybox
```
busybox is an image found on the dockerhub website

Now you need to upload the files from your local machine to the multipass instance and next to the docker container.

From the local to multipass instance use:
```
multipass mount <absolute_path_of_script_directory> ubuntu
```

Assuming you already have the test directory

```bash
docker run -it -v <absolute_path_of_script_directory>:<path_of_test_directory> busybox bash
```

Then you can test the script using your directory for backup and recovery

You finish you can set a cronjob for the script provided you don't stop your ubuntu instance and the container.

you can help me evaluate the process based on this and drop any issue encountered in the process:
>**Requirements:**
>1. Set up a Docker container with a directory containing mock data files.
>2. Write a script to compress the data using `tar` and store it in a backup directory.
>3. Schedule the script to run automatically using a `cronjob`.
>4. Create a recovery script to extract the backup and restore the files to their original location.
>5. Log all backup and recovery actions for later review.

## how to go about cronjob creation
first install the cron package\
```
sudo apt-get install cron -y
```
start and enable the cron service
```
systemctl start cron
systemctl enable cron
```
**syntax**:
Minutes Hours D_of_month Month D_of_week **command or script**

D=day
  
