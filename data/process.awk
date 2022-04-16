BEGIN {
    accented["á"] = "a´" 
    accented["à"] = "a`" 
    accented["â"] = "a^" 
    accented["ã"] = "a~" 
    accented["ä"] = "a:" 
    accented["ç"] = "c," 
    accented["é"] = "e´" 
    accented["è"] = "e`" 
    accented["ê"] = "e^" 
    accented["í"] = "i´" 
    accented["ó"] = "o´" 
    accented["ô"] = "o^" 
    accented["õ"] = "o~" 
    accented["ú"] = "u´" 
    accented["ü"] = "u:" 
    accented["ñ"] = "n~" 

    print("wordlist <- list(") > "wordlist.R"
}

{
    word = tolower($0)

    # Split the word into array of chars
    split(word, vector, "")

    # Replace accented chars
    for (i in vector) {
        new = accented[vector[i]]
        if (new != "")
            vector[i] = new
    }

    # Output vector in R notation
    printf("  c('^', ") > "wordlist.R" 
    for (i in vector) printf("'%s', ", vector[i]) > "wordlist.R" 
    printf("'$', '$'),\n") > "wordlist.R" 
}

# Insert this NA just because of the last comma above,
# then remove it
END {
    print("  NA\n)\n") > "wordlist.R" 
    print("wordlist <- wordlist[-length(wordlist)]") > "wordlist.R" 
}

