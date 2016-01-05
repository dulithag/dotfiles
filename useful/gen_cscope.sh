#!/bin/bash
echo --------------------------------------------------------
echo Generating tag files form $PWD
echo --------------------------------------------------------

rm cscope.in.out
rm cscope.out
rm cscope.po.out
rm cscope.files
touch tfiles 

find $PWD/x/y/l/* -name '*.h' -o -name '*.c' | sed 's/ /\\ /g' > tfiles 
find $PWD/x/z/abc/* -name '*.h' -o -name '*.c'| sed 's/ /\\ /g' >> tfiles 
find $PWD/x/z/include/* -name '*.h' -o -name '*.c' | sed 's/ /\\ /g' >> tfiles 
find $PWD/x/y/* -name '*.h' -o -name '*.c' | sed 's/ /\\ /g' >> tfiles 
find $PWD/x/tests/* -name '*.h' -o -name '*.c' | sed 's/ /\\ /g' >> tfiles 
find $PWD/z/* -name '*.h' -o -name '*.c' | sed 's/ /\\ /g'>> tfiles 

cat tfiles | grep -v "pic32\|stm32" > cscope.files

cscope -b -q -k
ctags -R $PWD
rm $PWD/tfiles
