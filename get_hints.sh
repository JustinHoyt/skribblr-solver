#! bash

# pass in a variable number of word lengths to get the matching words from the
# dictionary.txt file. `_` acts as a wildcard.
#
# usage
# ```
# $ ./get_hints.sh 3 4
# the pole
# all bird
#
# $ ./get_hints.sh 3 _
# the pole
# all bird
# nom nom
# eat doritos
# ```

awk -v args="$*" '
BEGIN { split(args, word_lengths) }
{
    for (i in word_lengths) {
        # If the word lengths do not match and the matcher is not a wildcard
        if (word_lengths[i] != length($i) && word_lengths[i] != "_")
            break
        # If at the end of iteration and all of the words have been checked
        if (i == length(word_lengths) && NF == length(word_lengths))
            print
    }
}' dictionary.txt
