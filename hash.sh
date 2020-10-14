

hash=`cat hash.txt`



a=1

while [ $a -lt 1000000 ]
do 
  a=`expr $a + 1`
  head=`head -$a store.txt | tail -1`
  brute=`echo -n $head | sha256sum | sed 's/ //g' | sed 's/-//g' | cut -c-50`
  echo $brute
  if [ $brute = $hash ]
then
echo $head>password.txt
printf "\n\npassword found : $head\n\n\n"
break
else
printf "\n\nChecking - $head - count - $a\n\n\n"
clear
fi

done