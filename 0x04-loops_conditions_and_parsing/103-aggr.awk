# computes a frequency list of the lines passed to awk

# executed for each line in the file stdin
{
  freq[$1 " " $2]++
}

# executed after the last line in stdin
END {
  for (word in freq)
    printf "    %d %s\n", freq[word], word
}
