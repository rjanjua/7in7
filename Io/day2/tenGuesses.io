randomNumber := Random value(1, 101) floor
lastGuessDiff := 101

guessDiff := method(
    "Take a guess buddy" println
    (randomNumber - (File standardInput readLine asNumber)) abs
)

guesses := 0
while(lastGuessDiff != 0 and guesses < 10, 
    diff := guessDiff()
    if(diff == 0, 
        "Congratulations, you win!",
        if(diff < lastGuessDiff, "warmer", "colder")
    ) println
    lastGuessDiff = diff
    guesses = guesses + 1
)

randomNumber println
