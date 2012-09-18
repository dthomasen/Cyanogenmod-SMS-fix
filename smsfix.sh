showMenu () {
	echo "Please select your CM version (press enter after choice)"
        echo "1) CM9 or 9.1"
        echo "2) CM10"
        echo "3) Quit"
}

go () {
echo "Pulling framework.jar from phone..."
mkdir working
./adb pull /system/framework/framework.jar working
echo "Decompiling and patching files"
java -jar baksmali-1.3.3.jar -o working/framework.jar.out working/framework.jar
if [ $1 == "CM9" ]
then 
	cp -rf cm9SonyQualcommRIL.smali working/framework.jar.out/com/android/internal/telephony/SonyQualcommRIL.smali
elif [ $1 == "CM10" ]
then
	cp -rf cm10SonyQualcommRIL.smali working/framework.jar.out/com/android/internal/telephony/SonyQualcommRIL.smali
fi
java -jar smali-1.3.3.jar -o working/classes.dex working/framework.jar.out
cd working
zip -u framework.jar classes.dex
echo "ready to push and reboot"
../adb remount
../adb push framework.jar /system/framework/framework.jar
../adb shell chmod 644 /system/framework/framework.jar
../adb reboot
echo "cleaning up"
cd ..
rm -r working
echo "Operation complete"
break
}

while [ 1 ]
do
        showMenu
        read CHOICE
        case "$CHOICE" in
                "1")
                        echo "You've choosen CM9 or 9.1"
			go "CM9"
                        ;;
                "2")
                        echo "You've choosen CM10"
                        go "CM10"
			;;
                "3")
                        exit
                        ;;
        esac
done
