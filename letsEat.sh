#!/bin/bash

# Function to display usage
usage() {
  echo "Usage: $0 [-breakfast|-lunch|-dinner|-all]"
  exit 1
}

# Check if lists directory exists
if [ ! -d "lists" ]; then
  echo "Error: 'lists' directory not found."
  exit 1
fi

# Function to randomly suggest food
suggest_food() {
  meal=$1
  list_file="lists/$meal.list"

  if [ -f "$list_file" ]; then
    suggestion=$(shuf -n 1 "$list_file")
    echo "Suggested $meal: $suggestion"
  else
    echo "No list found for $meal."
  fi
}

# If no arguments are provided, use interactive mode
if [ $# -eq 0 ]; then
  choice=$(whiptail --title "Meal Selector" --menu "Choose a meal for a food suggestion:" 15 60 5 \
  "breakfast" "Start your day" \
  "lunch" "Fuel up mid-day" \
  "dinner" "Finish your day strong" \
  "all" "Get suggestions for the whole day" 3>&1 1>&2 2>&3)

  case $choice in
    breakfast)
      suggest_food "breakfast"
      ;;
    lunch)
      suggest_food "lunch"
      ;;
    dinner)
      suggest_food "dinner"
      ;;
    all)
      suggest_food "breakfast"
      suggest_food "lunch"
      suggest_food "dinner"
      ;;
    *)
      echo "Operation cancelled."
      exit 0
      ;;
  esac

# Argument-based usage
elif [ $# -eq 1 ]; then
  case "$1" in
    -breakfast)
      suggest_food "breakfast"
      ;;
    -lunch)
      suggest_food "lunch"
      ;;
    -dinner)
      suggest_food "dinner"
      ;;
    -all)
      suggest_food "breakfast"
      suggest_food "lunch"
      suggest_food "dinner"
      ;;
    *)
      usage
      ;;
  esac
else
  usage
fi
