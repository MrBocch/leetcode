# @param {String} text
# @param {String} broken_letters
# @return {Integer}
def can_be_typed_words(text, broken_letters)
    broken = broken_letters.split("")

    return text.split(" ").filter{|w| (w.split("") & broken).empty? }.count
end