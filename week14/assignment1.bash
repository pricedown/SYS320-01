#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst() {
    echo -n "Please Input an Instructor Full Name: "
    read instName

    echo ""
    echo "Courses of $instName :"
    cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 |
        sed 's/;/ | /g'
    echo ""
}

function courseCountofInsts() {
    echo ""
    echo "Course-Instructor Distribution"
    cat "$courseFile" | cut -d';' -f7 |
        grep -v "/" | grep -v "\.\.\." |
        sort -n | uniq -c | sort -n -r
    echo ""
}

# TODO - 1
# Make a function that displays all the courses in given location
# function dislaplays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas
function displayRoomCourses() {
    echo -n "Please input a room and number: "
    read room

    echo ""
    echo "Courses in $room:"
    grep "$room" "$courseFile" | cut -d';' -f1,2,5,6,7 | sed 's/;/ | /g'
    echo ""
}

# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas
function displayAvailableCourses() {
    echo -n "Please input a course prefix: "
    read prefix

    echo ""
    echo "Available courses for $prefix:"

    while IFS=';' read -r code name credits seats days time instructor _; do
        if [[ "$code" == "$prefix"* && "$seats" -gt 0 ]]; then
            echo "$code | $name | Seats: $seats | $days | $time | $instructor"
        fi
    done <"$courseFile"

    echo ""
}

while :; do
    echo ""
    echo "Please select and option:"
    echo "[1] Display courses of an instructor"
    echo "[2] Display course count of instructors"
    echo "[3] Display courses in a room"
    echo "[4] Display courses for a course prefix"
    echo "[5] Exit"

    read userInput
    echo ""

    if [[ "$userInput" == "5" ]]; then
        echo "Goodbye"
        break

    elif [[ "$userInput" == "1" ]]; then
        displayCoursesofInst

    elif [[ "$userInput" == "2" ]]; then
        courseCountofInsts

    elif [[ "$userInput" == "3" ]]; then
        displayRoomCourses

    elif [[ "$userInput" == "4" ]]; then
        displayAvailableCourses

    else
        echo "Invlaid input"
    fi
done
