#!/bin/bash

# INSTALL ORACLE INSTANT CLIENT #
#################################

# NOTE: Oracle requires at least 1176 MB of swap (or something around there).
# If you are using CentOS in a VMWare VM, there's a good chance that you don't have enough by default.
# If this describes you and you need to add more swap, see the
# "Adding a Swap File to a CentOS System" section, here:
# http://www.techotopia.com/index.php/Adding_and_Managing_CentOS_Swap_Space

# Install basic dependencies
sudo yum -y install libaio bc flex

echo "Now go get some the following two RPMs ..."
echo "- basic: oracle-instantclient11.2-basic-11.2.0.3.0-1.x86_64.rpm"
echo "- SDK/devel: oracle-instantclient11.2-devel-11.2.0.3.0-1.x86_64.rpm"
echo "... from this URL: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html"
echo 'I will assume you have put these two files are into /home/docker'
echo "Press any key once you're ready" && read -n 1 -s

sudo rpm -ivh /home/docker/oracle-instantclient11.2-basic-*
sudo rpm -ivh /home/docker/oracle-instantclient11.2-devel-*

# SET ENVIRONMENT VARIABLES #
#############################

# Source for this section: http://cx-oracle.sourceforge.net/BUILD.txt

# (SIDENOTE: I had to alter it by doing some digging around for where the Oracle RPMs really installed to;
# if you ever need to do this, do a command like this:
#     rpm -qlp <rpm_file_of_concern.rpm>)

echo '# Oracle instantclient' >> $HOME/.bashrc
echo 'export ORACLE_VERSION="11.2"' >> $HOME/.bashrc
echo 'export ORACLE_HOME="/usr/lib/oracle/$ORACLE_VERSION/client64/"' >> $HOME/.bashrc
echo 'export PATH=$PATH:"$ORACLE_HOME/bin"' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$ORACLE_HOME/lib"' >> $HOME/.bashrc
. $HOME/.bashrc

echo "Script finished. Logout and login again or run 'source ~/.bashrc'" && read -n 1 -s

# INSTALL cx_Oracle #
#####################

#pip install cx_Oracle