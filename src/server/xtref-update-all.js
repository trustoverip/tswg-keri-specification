require('dotenv').config();

const updateXTrefs = require('spec-up-t/src/get-xtrefs-data.js').updateXTrefs;

updateXTrefs(process.env.GITHUB_API_TOKEN, false);