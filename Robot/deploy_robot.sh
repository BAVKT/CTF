#!/bin/bash

sudo apt-get -y install git php7.2-sqlite php7.2-mbstring php7.2-xml sqlite3
sudo service apache2 restart

cd /var/www/html

sudo git clone https://bitbucket.org/ublu/configuration_robot.git
sudo chown www-data:www-data -R configuration_robot

sudo cp /var/www/html/configuration_robot/robot_id.js /var/www/html/
sudo chown www-data:www-data robot_id.js

cp /var/www/html/configuration_robot/launch_ros.sh /home/keylo/
cp /var/www/html/configuration_robot/launch_site.sh /home/keylo/

sudo chown keylo:keylo /home/keylo/launch_ros.sh
sudo chown keylo:keylo /home/keylo/launch_site.sh

chmod u+x /home/keylo/launch_ros.sh
chmod u+x /home/keylo/launch_site.sh

cp /var/www/html/configuration_robot/launch_ros.desktop /home/keylo/Desktop/
cp /var/www/html/configuration_robot/launch_site.desktop /home/keylo/Desktop/

sudo chown keylo:keylo /home/keylo/Desktop/launch_ros.desktop
sudo chown keylo:keylo /home/keylo/Desktop/launch_site.desktop

chmod +x /home/keylo/Desktop/launch_ros.desktop
chmod +x /home/keylo/Desktop/launch_site.desktop


repos=("https://ipkathon01:%25TMw-%3du%2136M%5b%7de%2b6@github.com/ipkathon01/ipikathon_2018.git" "https://ipkathon02:28KpXT%2a5%7b%5d%2fCN3_H@github.com/ipkathon02/ipikathon_2018.git"  "https://ipkathon03:W%2b%28%3eV8aKpH2%2fp%2b%3e9@github.com/ipkathon03/ipikathon_2018.git"  "https://ipkathon04:H%5b%25%21a%3a_A%234%5cp%3bj%2aE@github.com/ipkathon04/ipikathon_2018.git" "https://ipkathon05:hheQ%3e~S%26P4%5cfW%3a5M@github.com/ipkathon05/ipikathon_2018.git" "https://ipkathon06:b9%5cau4NQ%5bv%24tAj4%5d@github.com/ipkathon06/ipikathon_2018.git" "https://ipkathon07:4ebLs%24Q%25tAj467%5d@github.com/ipkathon07/ipikathon_2018.git" "https://ipkathon08:4%24D6_SRfKPS6C%23v%21@github.com/ipkathon08/ipikathon_2018.git" "https://ipkathon09:8J8%5bh%3fMarD%3c%3bmgKQ@github.com/ipkathon09/ipikathon_2018.git" "https://ipkathon10:Y6x%2bYPT%24%3dxBX%266.%21@github.com/ipkathon10/ipikathon_2018.git" "https://ipkathon11:ZwYMU3.x%5d%3c%2cAv%3cdt@github.com/ipkathon11/ipikathon_2018.git" "https://ipkathon12:%40E%3d5%2bnd2Lu%40B2a%21H@github.com/ipkathon12/ipikathon_2018.git" "https://ipkathon13:%5bFjy3tUz4nY%26s_2W@github.com/ipkathon13/ipikathon_2018.git" "https://ipkathon14:%29PG%40yw6KJ%3eWaph2_@github.com/ipkathon14/ipikathon_2018.git" "https://ipkathon15:yJXy%5df7pT%29%3e8Fkj%26@github.com/ipkathon15/ipikathon_2018.git" "https://ipkathon16:6~2%2554%5c8dt%21Mr%5b%2cW@github.com/ipkathon16/ipikathon_2018.git" "https://ipkathon17:17ipkathon@github.com/ipkathon17/ipikathon_2018.git")

for number in {1..17}
do
	printf -v numberStr "%02d" $number
	local_dir="/var/www/html/team$numberStr"
	if [ ! -d "$local_dir/.git" ]
	then
		sudo git clone ${repos[number-1]} $local_dir
	else
		cd $local_dir
		sudo git pull ${repos[number-1]}
	fi
	sudo chown www-data:www-data -R $local_dir
done

xdg-desktop-menu install --novendor /home/keylo/Desktop/launch_site.desktop
xdg-desktop-menu install --novendor /home/keylo/Desktop/launch_ros.desktop

chromium-browser --start-fullscreen http://127.0.0.1/configuration_robot/config_webcam.php