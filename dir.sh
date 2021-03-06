  #!/bin/bash

  # if [ ! -d /home/StreamUpBox ]; then
  #   mkdir -m 777  -p /home/StreamUpBox;
  #   echo "Folder created with success!";
  # else
  #   echo "Folder already exists";
  # fi;
  var sh = require('shelljs');
var count = 0;
function annotateFolder (folderPath) {
  sh.cd(/home/StreamUpBox);
  var files = sh.ls() || [];

  for (var i=0; i<files.length; i++) {
    var file = files[i];

    if (!file.match(/.*\..*/)) {
      annotateFolder(file);
      sh.cd('../');
    } else {
      count++;
    }
  }
}
if (process.argv.slice(2)[0])
  annotateFolder(process.argv.slice(2)[0]);
else {
  console.log('There is no folder or files in this directory!');
}

console.log(count);