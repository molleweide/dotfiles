const emoji = require("node-emoji");
const fs = require("fs");
const inquirer = require("inquirer");
const config = require("./config");
const command = require("../../util/node/command");
const series = require("async.series");

inquirer
  .prompt([
    // {
    //   type: "confirm",
    //   name: "gitshots",
    //   message: "Do you want to use gitshots?",
    //   default: false,
    // },
    {
      type: "confirm",
      name: "packages",
      message: "Do you want to install packages from config.js?",
      default: false,
    },
  ])
  .then(function (answers) {
    // if(answers.gitshots){

    //   // additional brew packages needed to support gitshots
    //   config.brew.push('imagemagick', 'imagesnap')
    //   // ensure ~/.gitshots exists
    //   command('mkdir -p ~/.gitshots', __dirname, function(err, out) {
    //     if(err) throw err
    //   })
    //   // add post-commit hook
    //   command('cp ./.git_template/hooks/gitshot-pc ./.git_template/hooks/post-commit', __dirname, function(err, out) {
    //     if(err) throw err
    //   })
    // }else{
    //   if(fs.existsSync('./.git_template/hooks/post-commit')){
    //     // disable post-commit (in case we are undoing the git-shots enable)
    //     // TODO: examine and remove/comment out the file content with the git shots bit
    //     command('mv ./.git_template/hooks/post-commit ./.git_template/hooks/disabled-pc', __dirname, function(err, out) {
    //       if(err) throw err
    //     })
    //   }
    // }

    if (!answers.packages) {
      return console.log("skipping package installs"); // exit -------------
    }

    /*
     * 1. for all packages, prepare tasks
     *    a. log
     *    b. install tasks.
     *
     * 2. run all tasks w/async.series
     *    w/ supplied callback (cb)
     */
    const tasks = [];

    ["brew", "luarocks", "cask", "npm", "gem", "pip", "mas"].forEach((type) => {
      if (config[type] && config[type].length) {
        tasks.push((cb) => {
          console.info(
            emoji.get("coffee"),
            " installing " + type + " packages"
          );
          cb();
        });

        config[type].forEach((item) => {
          tasks.push((cb) => {
            console.info(type + ":", item);
            // node: __dirname = dir in which the currently executing script resides
            //    __dirname into /d1/d2/myscript.js, the value would be /d1/d2.
            // bash: '.' means cwd
            command(
              ". ../../util/sh/echos.sh && . ../../util/sh/requirers.sh && require_" +
                type +
                " " +
                item,
              __dirname, // what is dirname here? >> .../parts_mac
              function (err, stdout, stderr) {
                if (err) console.error(emoji.get("fire"), err, stderr);
                cb(); // not sure if this does something?
              }
            ); // commans ends
          });
        }); // ------------------------------------------------------------- install each package
      } else {
        tasks.push((cb) => {
          console.info(emoji.get("coffee"), type + " has no packages");
          cb();
        });
      } // ------------------------------------------------------------------ type has no packages
    });

    series(tasks, function (err, results) {
      console.log("package install complete");
    }); // --------------------------------------------------------------- run actuall install
  });
