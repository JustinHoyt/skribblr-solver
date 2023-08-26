#! bash

# pass in a variable number of word lengths to get the matching words from the
# dictionary.txt file. `_` acts as a wildcard.
#
# usage
# ```
# $ ./get_hints.sh 3 4
# the pole
# all bird
# ```

awk -v args="$*" '
BEGIN { split(args, word_lengths) }
{
    for (i in word_lengths) {
        if (i == length(word_lengths) && NF == length(word_lengths))
            print
    }
}' dictionary.txt
