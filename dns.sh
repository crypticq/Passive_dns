#!/bin/bash  



target=$1
file=$2
banner(){


	echo "###################################"
	echo "      Subdomain enumoration        "
	echo "      Coded By Eng Yazeed          "
	echo "      Instagram @COMMPLICATED      " 
	echo "      Usage dns.sh target.com      "                 
	echo "###################################"
}

if [ $# -eq 0 ]
  then
    echo "You must supply target homie , "
fi


hackertarget() {
  requests=$(curl -s "https://api.hackertarget.com/reversedns/?q=$target")
  printf "$requests \n " | cut -d, -f 1 >> $file
  echo "#######################################"
  echo "Results for hackertarget saved in $file"


}


crtsh(){

    requests=$(curl -s "https://crt.sh/?q=%25.$target" |sed 's/<\/\?[^>]\+>//g' | grep $target)
    printf "$requests \n " >> $file
    echo "#######################################"
    echo "Results for crt.sh saved in $file"
    cat $file | uniq -u
}

hackertarget
crtsh