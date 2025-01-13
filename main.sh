#!/bin/bash

# Function to handle the user's choice
function handle_choice() {
    if [[ "$choice" == "0" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Add content"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_add_content
    elif [[ "$choice" == "1" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Render specification"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_render
    elif [[ "$choice" == "2" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Export to PDF"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_topdf
    elif [[ "$choice" == "3" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Update existing xrefs"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_xrefs_update
    elif [[ "$choice" == "4" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Update all xrefs"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_xrefs_update_all
    elif [[ "$choice" == "5" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Add, remove or view xref sources"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_add_remove_xref_source
    elif [[ "$choice" == "6" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Configure this installation"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_configure
    elif [[ "$choice" == "7" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Open documentation website"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_help
    elif [[ "$choice" == "8" ]]; then
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Freeze specification"
        echo "  ************************************"
        echo " "
        echo " "
        show_progress
        do_freeze

    # # Example of confirmation prompt
    # elif [[ "$choice" == "4" ]]; then
    #     read -n 1 -r -p "  Are you sure? (y/N) " confirm
    #         echo  # Empty line below the prompt
    #         if [[ "$confirm" == [yY] ]]; then
    #             echo " "
    #             echo " "
    #             echo "  ************************************"
    #             echo "  The script will now …."
    #             echo "  ************************************"
    #             echo " "
    #             echo " "
    #             show_progress
    #             do_something
    #         else
    #             echo "Cancelled."
    #         fi
    else
        clear
        echo " "
        echo " "
        echo "  ************************************"
        echo "  Goodbye! You chose to exit."
        echo "  ************************************"
        echo " "
        echo " "
    fi
    echo " "
    echo " "
    echo " "
    echo "   SPEC-UP-T: Type 'npm run menu' to return to the main menu."
    echo " "
}

# Function to display the introduction text
function display_intro() {
    clear
    echo " "
    echo "  ,---.                  .   .        --.--"
    echo "  \`---.,---.,---.,---.   |   |,---.     |  "
    echo "      ||   ||---'|    ---|   ||   |---  |  "
    echo "  \`---'|---'\`---'\`---'   \`---'|---'     \`  "
    echo "       |                      |            "
    echo " "
    echo " "
    echo "  Please choose one of the following options:"
    echo " "
    echo "   [0] Add content"
    echo "   [1] Render specification"
    echo "   [2] Export to PDF"
    echo "   [3] Update new xrefs"
    echo "   [4] Update all xrefs"
    echo "   [5] Add, remove or view xref source"
    echo "   [6] Configure"
    echo "   [7] Open documentation website"
    echo "   [8] Freeze specification"
    echo "   [Q] Quit"
    echo " "
    echo "   An xref is a reference to another repository."
    echo " "
}

# Function to prompt the user for input
function prompt_input() {
    read -n 1 -r -p "   Enter your choice: " choice
    echo  # Empty line below the prompt
    echo  # Empty line below the prompt
}

function do_add_content() {
    clear
    echo -e "\n\n\n   ********************\n\n\n   You can start adding your content to the markdown files in the “spec” directory.\n\n   You can do this by editing local files in an editor or by going to your repository on GitHub.\n\n\n   ********************"  
}

function do_render() {
    clear
    npm run render
}

function do_topdf() {
    clear
    npm run topdf
}

function do_xrefs_update() {
    clear
    npm run xtrefupdate
}

function do_xrefs_update_all() {
    clear
    npm run xtrefupdateall
}

function do_add_remove_xref_source() {
    clear
    npm run addremovexrefsource
}

function do_configure() {
    clear
    npm run configure
}

function do_freeze() {
    clear
    npm run freeze
}

function do_help() {
    clear
    echo -e "\n\n\n   You will be redirected to the documentation website\n\n   (https://trustoverip.github.io/spec-up-t-website/)."
    sleep 2
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "https://trustoverip.github.io/spec-up-t-website/"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "https://trustoverip.github.io/spec-up-t-website/"
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        start "https://trustoverip.github.io/spec-up-t-website/"
    else
        echo "Unsupported OS."
    fi
}


# Function to show the progress of the scraping process
function show_progress() {
    for i in {1..3}
    do
      printf "."
      sleep 0.2
    done
}

# Main script starts here
display_intro
prompt_input
handle_choice

# End of script

