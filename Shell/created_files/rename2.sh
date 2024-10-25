renamefiles()
{
	echo "extension voulu: ";
	read destination;

	for i in $(ls | grep $origine); do
        	mv "$i" "${i%$origine}$destination";
	done
	ls | grep $destination;
}

deletefiles()
{
	rm *$origine;
}

echo "extension d'origine: ";
read origine;

echo "1. renomer";
echo "2. supprimer";
read option;

case $option in
        1) renamefiles
	  ;;
        2) deletefiles
	  ;;
        *) echo "optin non reconnu opération avorté"
	  ;;
esac
