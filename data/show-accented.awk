
/[^a-zA-Z]/  {
    s = tolower($0)
    gsub(/[a-zA-Z]+/, "", s)
    print(s)
} 

