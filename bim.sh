#!/bin/bash

#BMI Calculator

again=1

while [[ $again != 0 ]]
do
	echo "BMI Calculator"
	read -p "Enter your Age : " age
	read -p "Enter your Height (cm / centimeter) : " centi
	read -p "Enter your Weight (kg / kilograms) : " kilo

#echo "$centi"
#echo "$kilo"

#Calculate

cal=$(awk "BEGIN {printf \"%.2f\", $kilo / $centi / $centi * 10000}")

#Enter Status

echo "Your BMI is $cal"

if awk "BEGIN {exit !($age < 18 && $age >= 2)}"; then
	desc="Children"
elif awk "BEGIN {exit !($age > 18)}"; then
	desc="Adult"
else 
	echo "Invalid Number"
fi

clear

if awk "BEGIN {exit !($cal < 18.5 && $cal > 0)}"; then
    stat="Underweight"
elif awk "BEGIN {exit !($cal < 24.9 && $cal >= 18.5)}"; then
    stat="Normal Weight"
elif awk "BEGIN {exit !($cal < 29.9 && $cal >= 25)}"; then
    stat="Overweight"
elif awk "BEGIN {exit !($cal < 34.9 && $cal >= 30)}"; then
    stat="Obesity Class I"
elif awk "BEGIN {exit !($cal < 39.9 && $cal >= 35)}"; then
    stat="Obesity Class II"
elif awk "BEGIN {exit !($cal >= 40)}"; then
    stat="Obesity Class III"
else
    stat="Please check your inputs"
fi

echo "
BMI Calculator

Age : $age
Age Class : $desc
Height : $centi
Weight : $kilo
BMI : $cal
Category(WHO) : $stat"


read -p "Press any key to continue ..."
clear
done

