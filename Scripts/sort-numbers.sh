#!/bin/bash

# USING BUBBLE SORT
declare -a numberList
mainLoop=true

read -p "Input any amount of numbers (seperated by spaces, any letters will be ignored): " numbers
read -p "Input sort method ( bubble / selection ): " sortMethod
echo

for number in $numbers; do
	if [[ $number =~ ^[+-]?[0-9]*\.?[0-9]+$ ]]; then
		numberList+=($number)
	fi
done

listLength=${#numberList[@]}
declare -i totalSwaps
totalSwaps=0

while $mainLoop; do
	declare -i passCount
	passCount=0

	if [[ "$sortMethod" == "bubble" ]]; then
		# USING BUBBLE SORT
		# Bubble sort checks the current number and the number after it; if the current number is higher, it swaps them.
		# This is repeated until a run through of the list happens without swapping any numbers
		for index in ${!numberList[@]}; do
			num1=${numberList[index]}
			num2=${numberList[index+1]}

			if [[ $((index+1)) -eq $listLength ]]; then
				passCount=$((passCount+1))
				continue
			fi

			bool=false
			if [[ $num1 -gt $num2 ]]; then
				bool=true
			fi

			if $bool; then
				numberList[index]=${num2}
				numberList[index+1]=${num1}
				echo "Number $num1 at index $index swapped with number $num2 at index $((index+1))"
				totalSwaps=$((totalSwaps+1))
			else
				passCount=$((passCount+1))
			fi

			# To see the sort in action
			#echo "$passCount, ${numberList[@]}"
		done

		if [[ $passCount -eq $listLength ]]; then
			mainLoop=false
		fi
	elif [[ "$sortMethod" == "selection" ]]; then
		echo "This sorting method is not finished yet, try 'bubble' instead."
		mainLoop=false
		# USING SELECTION SORT
		# Selection sort checks the current number and finds the lowest number in the list; if the current number is higher, it swaps them.
		# This is repeated until a run through of the list happens without swapping any numbers
	fi
done

echo
echo "Initial list: $numbers"
echo "Sorted list: ${numberList[@]}"
echo "Total swaps made: $totalSwaps"
