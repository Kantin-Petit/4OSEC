echo "extension d'origine: "
read origine;
echo "extension voulu: "
read destination;

for i in *$origine; do
	mv "$i" "${i%$origine}$destination";
done 
