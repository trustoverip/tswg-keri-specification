const fs = require('fs');
const path = require('path');

// Resolve the path to specs.json in the root directory
const JSON_FILE = path.resolve(process.cwd(), 'specs.json');

// Check if the JSON file exists
if (!fs.existsSync(JSON_FILE)) {
    console.error(`Error: ${JSON_FILE} does not exist.`);
    process.exit(1);
}

// Ask the user for inputs
const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

let mode = ""; // To track if user wants to add or remove

// Function to prompt for mode
function askMode() {
    rl.question('Would you like to add, remove, or view entries? (add/remove/view): ', (answer) => {
        mode = answer.trim().toLowerCase();
        if (mode === 'add' || mode === 'a') {
            askQuestion(0);
        } else if (mode === 'remove' || mode === 'r') {
            askRemoveEntry();
        } else if (mode === 'view' || mode === 'v') {
            showReferences();
        } else {
            console.log('Invalid option. Please enter add, remove, or view.');
            askMode();
        }
    });
}

// Questions for adding an entry
const questions = [
    'Enter URL of the repository: ',
    'Enter URL of the GitHub page: ',
    'Enter the directory where the terms can be found: ',
    'Enter short unique name: ',
];

let inputs = {};

// Function to ask questions for adding an entry
function askQuestion(index) {
    if (index === questions.length) {
        rl.close();
        updateJSON();
        return;
    }

    rl.question(questions[index], (answer) => {
        switch (index) {
            case 0:
                inputs.url = answer;
                break;
            case 1:
                inputs.gh_page = answer;
                break;
            case 2:
                inputs.terms_dir = answer;
                break;
            case 3:
                inputs.external_spec = answer;
                break;
        }
        askQuestion(index + 1);
    });
}

// Function to prompt for removal
function askRemoveEntry() {
    rl.question('Enter the short unique name of the entry you want to remove: ', (answer) => {
        removeEntry(answer.trim());
        rl.close();
    });
}

// Function to show current external references
function showReferences() {
    const data = JSON.parse(fs.readFileSync(JSON_FILE, 'utf8'));
    console.log('\nCurrent external references (xref):\n\n');

    data.specs[0].external_specs.forEach(spec => {
        console.log('--- External Reference: ---');
        console.log(`Short name: ${spec.external_spec}`);
        console.log(`GitHub Page: ${spec.gh_page}`);
        console.log(`URL: ${spec.url}`);
        console.log(`Terms Directory: ${spec.terms_dir}`);
        console.log('\n');
    });
    rl.close();
}

// Update the JSON file by adding an entry
function updateJSON() {
    try {
        const data = JSON.parse(fs.readFileSync(JSON_FILE, 'utf8'));

        if (!data.specs || !Array.isArray(data.specs) || !data.specs[0].external_specs) {
            console.error('Error: Invalid JSON structure. "specs[0].external_specs" is missing.');
            process.exit(1);
        }

        const externalSpecs = data.specs[0].external_specs;

        // Check if the external_spec already exists
        const exists = externalSpecs.some(
            (entry) => entry.external_spec === inputs.external_spec
        );

        if (exists) {
            console.log(
                `Entry with external_spec "${inputs.external_spec}" already exists. No changes made.`
            );
            return;
        }

        // Add the new entry if it doesn't exist
        externalSpecs.push(inputs);

        fs.writeFileSync(JSON_FILE, JSON.stringify(data, null, 2), 'utf8');
        // console.log(`Updated ${JSON_FILE} successfully.`);
        console.log(`Updated successfully.`);
    } catch (error) {
        console.error(`Error: Failed to update ${JSON_FILE}.`, error.message);
        process.exit(1);
    }
}

// Remove an entry based on `external_spec`
function removeEntry(externalSpec) {
    try {
        const data = JSON.parse(fs.readFileSync(JSON_FILE, 'utf8'));

        if (!data.specs || !Array.isArray(data.specs) || !data.specs[0].external_specs) {
            console.error('Error: Invalid JSON structure. "specs[0].external_specs" is missing.');
            process.exit(1);
        }

        const externalSpecs = data.specs[0].external_specs;

        // Filter out the entry with the matching external_spec
        const filteredSpecs = externalSpecs.filter(
            (entry) => entry.external_spec !== externalSpec
        );

        if (filteredSpecs.length === externalSpecs.length) {
            console.log(`No entry found with external_spec "${externalSpec}".`);
            return;
        }

        // Update the JSON structure
        data.specs[0].external_specs = filteredSpecs;

        fs.writeFileSync(JSON_FILE, JSON.stringify(data, null, 2), 'utf8');
        // console.log(`Removed entry with external_spec "${externalSpec}" successfully.`);
        console.log(`Removed entry successfully.`);
    } catch (error) {
        console.error(`Error: Failed to update ${JSON_FILE}.`, error.message);
        process.exit(1);
    }
}

// Start by asking the mode
askMode();
