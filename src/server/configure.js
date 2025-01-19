/**
 * This script configures the Spec-Up-T Starterpack by prompting the user for input
 * and updating the specs.json file accordingly. It performs the following tasks:
 * 
 * 1. Resolves the path to the specs.json file in the root directory.
 * 2. Checks if the specs.json file exists, and exits with an error if it does not.
 * 3. Creates a readline interface to prompt the user for input.
 * 4. Defines a set of questions to gather information from the user.
 * 
 * @module configure
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');

// Resolve the path to specs.json in the root directory
const JSON_FILE_PATH = path.resolve(process.cwd(), 'specs.json');

// Key for accessing specs in the JSON file
const SPECS_KEY = 'specs';

// Check if the JSON file exists
if (!fs.existsSync(JSON_FILE_PATH)) {
    console.error(`Error: ${JSON_FILE_PATH} does not exist.`);
    process.exit(1);
}

// Create the readline interface
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

// Questions for user input
const questions = [
    { field: 'title', prompt: 'Enter title: ', default: 'Spec-Up-T Starterpack' },
    { field: 'description', prompt: 'Enter description: ', default: 'Create technical specifications in markdown. Based on the original Spec-Up, extended with Terminology tooling' },
    { field: 'author', prompt: 'Enter author: ', default: 'Trust over IP Foundation' },
    { field: 'account', prompt: 'Enter account: ', default: 'trustoverip' },
    { field: 'repo', prompt: 'Enter repo: ', default: 'spec-up-t-starter-pack' },
];

const userResponses = {};

// Function to prompt the user for inputs
function collectUserInputs(index = 0) {
    if (index === questions.length) {
        rl.close();
        applySpecFieldsToJSON();
        return;
    }

    const { prompt, default: defaultValue } = questions[index];
    rl.question(`${prompt} (${defaultValue}): `, (answer) => {
        userResponses[questions[index].field] = answer || defaultValue;
        collectUserInputs(index + 1);
    });
}

// Function to update JSON with user-provided spec fields
function applySpecFieldsToJSON() {
    try {
        const data = JSON.parse(fs.readFileSync(JSON_FILE_PATH, 'utf8'));

        if (!data[SPECS_KEY] || !Array.isArray(data[SPECS_KEY]) || !data[SPECS_KEY][0]) {
            console.error(`Error: Invalid JSON structure. "${SPECS_KEY}[0]" is missing.`);
            process.exit(1);
        }

        // Ensure the "source" key exists in the JSON object
        if (!data[SPECS_KEY][0].source) {
            data[SPECS_KEY][0].source = {};
        }

        // Iterate over user responses and assign fields accordingly
        Object.entries(userResponses).forEach(([field, value]) => {
            if (['account', 'repo'].includes(field)) {
                // Add these fields to the "source" key
                data[SPECS_KEY][0].source[field] = value;
            } else {
                // Add all other fields to the root of the JSON object
                data[SPECS_KEY][0][field] = value;
            }
        });

        fs.writeFileSync(JSON_FILE_PATH, JSON.stringify(data, null, 2), 'utf8');
        console.log(`Successfully updated ${JSON_FILE_PATH}.`);
    } catch (error) {
        console.error(`Error: Could not update ${JSON_FILE_PATH}.`, error.message);
        process.exit(1);
    }
}

// Start user input collection
collectUserInputs();
