The main aim of "SlackBuild Automate" is to help the user in installing packages through the prebuilt scripts avaialable on https://slackbuilds.org/ , so that most of the procedure itself would be executed by the script.

It is written in bash and as of now the user must install the built package with the "installpkg" command (refer to this guide for a general introduction on Slackware's package managment system : https://docs.slackware.com/slackbook:package_management). 

The packages are located in the /tmp folder once succesfully compiled and built.

"SlackBuild Automate" does not help the user with dependencies as those would still have to be manually managed by the system administrator, as in the usual Slackware manner.

The script will ask the user for three things : the package name, the link of the SlackBuilds archive, and the link of the actual software sources. 
Those three things must be obtained from the https://slackbuilds.org/ website. 

Examples : Say for example one wants to install the "gnustep-make" package, the relevant SlackBuild page would be : 
https://slackbuilds.org/repository/15.0/development/gnustep-make/ .

Therefore, when running this software, the user will follow this procedure: 

      Please type the name of the package you want to build and install: gnustep-make
      Please type the link of the SlackBuild archive: https://slackbuilds.org/slackbuilds/15.0/development/gnustep-make.tar.gz
      Please type the package sources link: ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-make-2.8.0.tar.gz




