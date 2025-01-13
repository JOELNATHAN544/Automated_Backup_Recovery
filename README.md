## This is an automated backup and recovery exercise in a container
### Members of the group
- Nkwenti Severian
- Nyengka Prosper
- Nathan Joel
> Remember everything in this work requires absolute path.\

To achieve this successfully, you need the following :

- clone this repository
- Multipass instance
- Docker container

You can install your multipass and run an instance using
```sh
sudo apt update && sudo apt install snapd && sudo snap install multipass && multipass launch docker --name ubuntu
```
if you receive an error message use this command to verify if the instance ubuntu is running:
```
multipass list
```

Now you need to alias **"mulltipass exec ubuntu -- docker"** to **"docker"** in your shell configuration file(.bashrc or .zshrc.\
This is to facilitate the execution of commands in your instance without loggin into it, even if the instance is started or not.

You now run the command
```
sudo docker pull ubuntu
```
ubuntu is an image found on the dockerhub website, that supports bash shell environment.

Now you run an ubuntu image, that provide you an interactive bash environment using:
```
sudo docker run -it --name container ubuntu bash
```
now you run:
```
cd home/ubuntu/
```
this will take you to the user ubuntu directory\

Good!\
Next, you need to install a package to clone this repository using this command:
```
apt update && apt install git -y && git clone https://github.com/Nkwenti-Severian-Ndongtsop/Automated_Backup_Recovery.git
```
you can ceate a directory or sub-directories to contain your mock data_files\
and clone the repository below that contains mock data\
```
git clone https://github.com/Nkwenti-Severian-Ndongtsop/mock_data.git
```

Excellent!

Now cd into the Automated_Backup_Recovery directory\
run this to make the scripts executable
```
chmod +x back_up.sh && chmod +x recover.sh
```
you can execute the **back_up.sh** and then **recover.sh**\
You can check the logs after each execution\
the backup_folder is found in the /home/ubuntu/backup_folder\
feel free to play around.

Finally you can set a cronjob for the script provided you don't stop your ubuntu instance and the container.

you can help me evaluate the process based on this and drop any issue encountered in the process:
>**Requirements:**
>1. Set up a Docker container with a directory containing mock data files.
>2. Write a script to compress the data using `tar` and store it in a backup directory.
>3. Schedule the script to run automatically using a `cronjob`.
>4. Create a recovery script to extract the backup and restore the files to their original location.
>5. Log all backup and recovery actions for later review.

## how to go about cronjob creation
first install the cron package in your container with a text-editor\
use this command:
```
apt-get install cron -y && apt install nano
```

After that, you can access the crontab file,in order to set your desired cron job:

```
crontab -e
```

Firstly you need to make the file executable, then put it in the crontab file:
```
chmode +x <file-name>
```
You can try mine:\
**0 0 * * * back_up.sh**\
you can add that in the crontab file\
remember to replace **back_up.sh with the absolute path to the filee

That will run the back_up file everyday

### This marks the end. In case of any issue, you report to us in issues
  
