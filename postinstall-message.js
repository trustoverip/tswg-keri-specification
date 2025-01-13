// load path module
const path = require('path');
// get current directory name
const dirName = path.basename(process.cwd());

process.nextTick(() => {
    console.log(`
*************
Next:
* 1: Type the following and press ENTER: cd ${dirName}
* 2: Type the following and press ENTER: npm run menu
*************
`);
});