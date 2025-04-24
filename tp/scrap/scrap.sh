#!/bin/bash


URL="https://readi.fi/sitemap.xml"

function link() {
	#recupère la page
	pages_content=$(curl -s "$1")
	
	#recupere les url dans la pages et les met dans urltemp.txt
	echo "$pages_content" | grep -o 'https://readi\.fi\/asset[^"<]*' | sort -u > urltemp.txt
}

function insert_db() {
	sqlite3 meta_données.db <<EOF
INSERT INTO data (url, title, description) values ('$1', '$2', '$3');
EOF
}

# Le fait de concaténer les arguments à la requête sql permet des injections sql
# Typiquement si $1=toto, $2=toto et $3 = "toto'); DROP TABLE data;" 
# La requête sql devient
# INSERT INTO data (url, title, description) values ('toto', 'toto', 'toto'); DROP TABLE data;

# Pour éviter cela il faut utiliser des requêtes préparées
# "INSERT INTO data (url, title, description) values (?, ?, ?);" "$1" "$2" "$3"

# Ansi, si $3 = "toto'); DROP TABLE data;"
# La requête sql devient
# INSERT INTO data (url, title, description) values ("toto", "toto", "toto'); DROP TABLE data;");


function scrap() {
	#recupère la page
	pages_content=$(curl -s "$1")

	title=$(echo "$pages_content" | grep -oP '(?<=<title>).*?(?=</title>)')

	echo "Titre: $title";

	description=$(echo "$pages_content" | grep -oP '(?<=<meta name="description" content=").*?(?=")') 

	insert_db "$1" "$title" "$description"
}

link $URL 

echo "nombre lien :$(wc -l < urltemp.txt)"

while IFS= read -r page_url; do
	scrap "$page_url"
done < urltemp.txt
