#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

if [[ -z $USER_ID ]]
then
  INSERT_NEW_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAME_STATS=$($PSQL "SELECT COUNT(*), MIN(guesses) 
  FROM game_statistics
  WHERE user_id=$USER_ID")

  echo $GAME_STATS | while IFS="|" read COUNT PB
  do
    echo -e "\nWelcome back, $USERNAME! You have played $COUNT games, and your best game took $PB guesses."
  done
fi

# start game
ANSWER=$(( $RANDOM % 1001 ))
NUM_GUESSES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read YOUR_GUESS

while [[ $YOUR_GUESS != $ANSWER ]]
do
  if [[ ! $YOUR_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read YOUR_GUESS
  else
    if [[ $YOUR_GUESS > $ANSWER ]]
    then
      NUM_GUESSES=$(($NUM_GUESSES + 1))
      echo -e "\nIt's lower than that, guess again:"
      read YOUR_GUESS
    else
      if [[ $YOUR_GUESS < $ANSWER ]]
      then
        NUM_GUESSES=$(($NUM_GUESSES + 1))
        echo -e "\nIt's higher than that, guess again:"
        read YOUR_GUESS
      fi
    fi
  fi
done

INSERT_GAME_RESULT=$($PSQL "INSERT INTO game_statistics(user_id, guesses) VALUES($USER_ID, $NUM_GUESSES)")
echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $ANSWER. Nice job!"
