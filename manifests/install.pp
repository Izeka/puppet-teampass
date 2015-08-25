class teampass::install(
 $teampass_version = $teampass::params::teampass_version, 
 $src_target = $teampass::params::src_target,
 $dst_folder = $teampass::params::dst_folder,
 $mv_command = $teampass::params::mv_command,
 $teampass_url = $teampass::params::teampass_url,
 $teampass_config_file=  $teampass::params::teampass_config_file,
 $teampass_config_folder=  $teampass::params::teampass_config_folder
)inherits teampass::params{
 
 package {['php','php-mysql','php-mcrypt','php-ldap','php-mbstring','php-bcmath',]:
	ensure => present,
	allow_virtual => false
 }
 archive {'teampass':
   archive_name => $teampass_version,
   url => $teampass_url,
   require => Package['httpd']
 }

 exec{'move to folder':
   command => $mv_command,
   creates => "/var/www/html/teampass",
   require => Archive['teampass'],
 }
 file{"$teampass_config_location/$teampass_config_file":
        source => "puppet:///modules/teampass/$teampass_config_file",
        owner => 'apache',
        group => 'apache',
        mode => '0640',
        require => Package['httpd'],
        notify => Service['httpd'],
 }
}

