#!/bin/bash
# count the words in  text
tr -sc '[A-Z][a-z]' '[\012*]' < aeneid.txt | sort | uniq -c > aeneid.hist

# check the first five words
tr -sc '[A-Z][a-z]' '[\012*]' < aeneid.txt | sed 5q

# counting the qty of the first five unique tokens in lexicographic order
tr -sc '[A-Z][a-z]' '[\012*]' < aeneid.txt | sort | uniq -c | sed 5q

# couting caps vowels
tr -sc '[A-Z][a-z]' < aeneid.txt | tr -sc 'AEIOU' '[\012*]' | sort | uniq -c

# couting caps consonants
tr -s '[A-Z][a-z]' < aeneid.txt | tr -sc 'BCDFGHJKLMNPQRSTXWXYZ' '[\012*]' | sort | uniq -c

# couting caps consonants and ordering in reverse numeric order
tr -sc '[A-Z][a-z]' < aeneid.txt | tr -sc 'BCDFGHJKLMNPQRSTXWXYZ' '[\012*]' | sort -nr | uniq -c

# reversing word
echo lucas | rev

# getting bigrams (word(i) + word(i+1))
tr -sc '[A-Z][a-z]' '[\012*]' < aeneid.txt > aeneid.words 
tail +2 aeneid.words > aeneid.nextwords

paste aeneid.words aeneid.nextwords | sort | uniq -c > aeneid.bigrams

# counting trigrams
tail +2 aeneid.nextwords > aeneid.nextwords_trigram

paste aeneid.words aeneid.nextwords aeneid.nextwords_trigram | sort | uniq -c > aeneid.trigrams	
