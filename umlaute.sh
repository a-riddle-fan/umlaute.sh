#!/bin/bash
# Ersetzt Deutsche Umlaute durch HTML Code Sequenzen
# Syntax: umlaute.sh <meinedatei.html> z. B. ./umlaute.sh index.html

# Überprüfen, ob eine Datei übergeben wurde
if [ "$#" -ne 1 ]; then
    printf "Usage: %s <meinedatei.html>\n" "$0"
    exit 1
fi

# Datei und Backup-Name definieren
declare input_file="$1"
declare backup_file="${input_file%.html}_$(date +%Y-%m-%d).bak"

# Backup erstellen
cp "$input_file" "$backup_file"

# Ersetzen von Umlauten und Sonderzeichen in einer separaten Datei
declare sed_script_file="sed_script.sed"

# Erstellen der sed-Skriptdatei
cat << 'EOF' > "$sed_script_file"
s/Ä/&Auml;/g
s/ä/&auml;/g
s/Ö/&Ouml;/g
s/ö/&ouml;/g
s/Ü/&Uuml;/g
s/ü/&uuml;/g
s/ß/&szlig;/g
s/&/&amp;/g
s/-/&ndash;/g
s/ /&nbsp;/g
s/</&lt;/g
s/>/&gt;/g
s/x/&times;/g
s/\^/&circ;/g
s/r/&rarr;/g
s/b/&bull;/g
s/e/&euro;/g
EOF

# HTML Umstellung
sed -i -f "$sed_script_file" "$input_file"

# Aufräumen: sed-Skriptdatei löschen
rm "$sed_script_file"
