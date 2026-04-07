#!/bin/bash

num_one=''
num_two=''
operator=''
answer=''

menu_options() {
	echo -e "
	first number = $num_one
	second number = $num_two
	operator = $operator
	previous answer = $answer

	|Choose an option from below|
	-----------------------------
	|
	| A) Choose or change first number
	|
	| B) Choose or change the second number
	|
	| C) Select an operator
	|
	| D) Calculate with given numbers and operator
	|
	| X) Exit calculator
	|
	-----------------------------
	"
	read input
	echo

	case $input in
		'a'|'A') set_first_number;;
		'b'|'B') set_second_number;;
		'c'|'C') set_operator;;
		'd'|'D') calculate;;
		'x'|'X') exit;;
	esac
}

set_first_number() {
	read -p "Enter the first number: " input
	num_one=$input
}

set_second_number() {
	read -p "Enter the second number: " input
	num_two=$input
}

set_operator() {
	read -p "Please enter one of the following operators (+,-,*,/): " input
	case $input in
		'+') operator='+';;
		'-') operator='-';;
		'*') operator='*';;
		'/') operator='/';;
		*) echo "You did not select a valid operator; skipping operator selection.";;
	esac
}

calculate() {
	if [[ -z $num_one || -z $num_two || -z $operator ]]; then
		return
	fi

	answer=$(($num_one $operator $num_two))
	echo "The answer to $num_one $operator $num_two is $answer"
}

test=true

while $test; do
	menu_options
done
