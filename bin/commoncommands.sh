history | sed "s/^[0-9 ]*//" | awk '{print $1 " " $2}' | sort | uniq -c | sort -rn | head -n 40
