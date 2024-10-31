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