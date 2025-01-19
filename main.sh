#!/bin/bash

# Function to handle the user's choice
function handle_choice() {
    local options=(
        "Add content" "do_add_content"
        "Render specification" "do_render"
        "Export to PDF" "do_topdf"
        "Update new xrefs" "do_xrefs_update"
        "Update all xrefs" "do_xrefs_update_all"
        "Add, remove or view xref source" "do_add_remove_xref_source"
        "Configure" "do_configure"
        "Open documentation website" "do_help"
        "Freeze specification" "do_freeze"
    )

    if [[ "$choice" =~ ^[0-8]$ ]]; then
        local index=$((choice * 2))
        echo -e "\n\n  ************************************"
        echo "  ${options[index]}"
        echo -e "  ************************************\n\n"
        show_progress
        ${options[index + 1]}
    else
        clear
        echo -e "\n\n  ************************************"
        echo "  Goodbye! You chose to exit."
        echo -e "  ************************************\n\n"
    fi
    echo -e "\n\n\n   SPEC-UP-T: Type 'npm run menu' to return to the main menu.\n"
}

# Function to display the introduction text
function display_intro() {
    clear
    cat << EOF

  ,---.                  .   .        --.--
  \`---.,---.,---.,---.   |   |,---.     |  
      ||   ||---'|    ---|   ||   |---  |  
  \`---'|---'\`---'\`---'   \`---'|---'     \`  
       |                      |            

  Please choose one of the following options:

   [0] Add content
   [1] Render specification
   [2] Export to PDF
   [3] Update new xrefs
   [4] Update all xrefs
   [5] Add, remove or view xref source
   [6] Configure
   [7] Open documentation website
   [8] Freeze specification
   [Q] Quit

   An xref is a reference to another repository.

EOF
}

# Function to prompt the user for input
function prompt_input() {
    read -n 1 -r -p "   Enter your choice: " choice
    echo -e "\n"
}

function do_add_content() {
    clear
    echo -e "\n\n\n   ********************\n\n\n   You can start adding your content to the markdown files in the "spec" directory.\n\n   You can do this by editing local files in an editor or by going to your repository on GitHub.\n\n\n   ********************"  
}

function do_render() { clear; npm run render; }
function do_topdf() { clear; npm run topdf; }
function do_xrefs_update() { clear; npm run xtrefupdate; }
function do_xrefs_update_all() { clear; npm run xtrefupdateall; }
function do_add_remove_xref_source() { clear; npm run addremovexrefsource; }
function do_configure() { clear; npm run configure; }
function do_freeze() { clear; npm run freeze; }

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

function show_progress() {
    for i in {1..3}; do printf "."; sleep 0.2; done
}

# Main script
display_intro
prompt_input
handle_choice