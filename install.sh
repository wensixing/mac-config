#/bin/sh
file=(screenrc vim vimrc zshrc)
echo 'mac-conf install starting ...'
echo
dir=`pwd`
for f in "${file[@]}"
do
    echo "Delete $f in your device"
    rm -rf ../.$f
    echo "link new $f ..."
    ln -s $dir/$f ~/`echo $f | sed 's/^/./g'`
    echo "OK!"
done
echo
echo "mac-conf install done !!"

