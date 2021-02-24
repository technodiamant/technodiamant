#!/bin/bash
echo ""
echo "Anna Martynova"
echo "programmka 13"
echo "-----------------------"
echo "We will help you"

for ((;;))
do
echo ""
echo "You here:"
for ((;;))
do
echo ""
echo "All files: " $(ls)

echo ""
read -p "Enter filename: " filename

if [ -e "$filename" ]
then
echo "found file - $filename"
break
else
echo "file not found" >&2
fi
done

echo ""
echo "Info about your file:"
stat $filename

echo ""
read -p "Enter date (yy-mm-dd): " d

your_d=$(date +"%d-%m-%y" -d"$d")
file_d=$(date +"%d-%m-%y" -d"@$(stat -c%Z $filename)")

echo ""
echo "File date: $file_d"
echo "Your date: $your_d"

if [[ "$file_d" -eq "$your_d" ]]
then
echo "EQ"
else
echo "ERR" >&2
exit 120
fi

echo ""
echo "stop - 0, continue - 1"
read result
if [ "$result" -eq 0 ]
then
break
fi
done
