class teampass::params{
	$src_target = "/usr/src"
	$dst_folder = "/var/www/html/teampass"
	$mv_command = "/bin/mv $src_target/TeamPass-master /var/www/html/teampass"
	$teampass_version= "master.zip"
	$teampass_url = "https://github.com/nilsteampassnet/TeamPass/archive/$teampass_version"
        $teampass_config_folder=  "/etc/httpd/conf.d"
        $teampass_config_file=  "teampass.conf"
}
 
