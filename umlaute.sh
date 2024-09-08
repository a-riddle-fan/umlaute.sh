#!/bin/bash
# Ersetzt Deutsche Umlaute durch HTML Code Sequenzen
# Autor: Adrian Feld (adrian@adminquest.de)
# Syntax: umlaute.sh <meinedatei.html> z. B. ./umlaute.sh index.html

# Überprüfen, ob eine Datei übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <meinedatei.html>"
    exit 1
fi

# Kein Backup kein Mitleid
cp "$1" "$1.bak"

# HTML Umstellung
sed -i -e 's/Ä/&Auml;/g; 
            s/ä/&auml;/g; 
            s/Ö/&Ouml;/g; 
            s/ö/&ouml;/g; 
            s/Ü/&Uuml;/g; 
            s/ß/&szlig;/g; 
            s/ü/&uuml;/g; 
            s/&/&amp;/g; 
            s/-/&ndash;/g; 
            s/ /&nbsp;/g; 
            s/</&lt;/g; 
            s/>/&gt;/g; 
            s/x/&times;/g; 
            s/\^/&circ;/g; 
            s/r/&rarr;/g; 
            s/b/&bull;/g; 
            s/e/&euro;/g;' "$1"
