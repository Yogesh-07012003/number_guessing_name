#!/bin/bash
# Connect to the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for the username
echo "Enter your username:"
read USERNAME

# Check if the user exists in the database
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME';")


if [[ -z $USER_DATA ]]
then
  # If the username does not exist, welcome the new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert the new user into the database
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0);")
else
  # If the username exists, extract user information and display welcome message
  echo "$USER_DATA" | while IFS="|" read USER_ID GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
# Generate a random secret number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# Handling Guesses Loop
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  # Check if the input is a valid integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    (( NUMBER_OF_GUESSES++ ))

    # Check if the guess is correct
    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  fi
done


# Update the user's game statistics in the database
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME';")
echo "$USER_DATA" | while IFS="|" read USER_ID GAMES_PLAYED BEST_GAME
do
  # Increment the number of games played
  GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))

  # Update the best game if the current number of guesses is lower
  if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
  then
    BEST_GAME=$NUMBER_OF_GUESSES
  fi

  # Update the user record in the database
  UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID;")
done
