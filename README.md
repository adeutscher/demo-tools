
# Demo Module

This is a demonstration of the module concept used by my [core-tools](https://github.com/adeutscher/core-tools) collection.

The intent of module system is to make it convenient to load tools or SSH configurations that I do not want to place on multiple machines.
One might make a module for the for one of the following reasons:

* The tools contain sensitive information (e.g. passwords, network addresses, SSH keys).
  Putting these on every machine with core-tools would be a major security risk.
* The tools contain scripts of little to no use on a particular machine. For example:
  * Game-related scripts on a work-related machine (or vice versa).
  * Sound-related scripts on a headless server.

This demo module was created because nearly every one of my private modules has some amount of sensitive information more critical than the minor amount of scrubbing that goes into the public export. This make sharing the concept a bit difficult. The remaining module is 'audio-tools', which is made to play silly sounds on machines as alerts. I'm withholding this one because I'm paranoid about it getting taken down due to the possibly-copywrited sound bites that it uses, and because it has no SSH configuration to better demonstrate the `ssh-compile-config` script.

## Setup

1. Clone core-tools into `~/tools/`:

Command:

    git clone https://github.com/adeutscher/core-tools.git ~/tools/core-tools

2. Run core-tools setup script:

Command:

    ~/tools/core-tools/scripts/setup/setup-tools.sh

3. Open a new BASH terminal window or source in `~/.bashrc`:

Command:

    . ~/.bashrc

4. Clone demo-tools into `~/tools/`:

Command:

    git clone https://github.com/adeutscher/demo-tools.git ~/tools/demo-tools

5. Reload existing BASH session:

Command:

    reload

## Usage

To observe SSH being compiled from multiple modules, run `ssh-compile-config`:

    ssh-compile-config

SSH configuration compilation detects changes to your modules' SSH configuration files, and updates your `~/.ssh/config` file. It then reports in on modules that have had updated configurations. If you wish to test this feature without meddling with your current `~/.ssh/config` file, provide a path as your first argument:

    ssh-compile-config demo-config

See the `core-tools` README for more information on SSH config compilation.

To update all tool modules, use `update-tools`:

    update-tools

Updating your modules will also run `ssh-compile-config`.

## Making Your Own Module

This module can be used a basis for making your own module. To do so:

1. Replace any reference to `demoToolsDir` with your new module variable. This variable **must** end in 'toolsDir` for SSH config compilation.

Convenient `sed` method:

    sed -i 's/demoToolsDir/newToolsDir/g' bash/bashrc bash/functions/03-tools.sh scripts/networking/ssh-fix-permissions*

2. Edit `bash/functions/03-tools` and rename any remaining references to 'demo'. Most of these are cosmetic, but the `update-tools-demo` function **must** be given a new name still beginning with **update-tools-** (e.g. `update-tools-new`).

Convenient `sed` method:

    sed -i 's/update-tools-demo/update-tools-new' bash/functions/03-tools.sh

3. Rename the script `scripts/networking/ssh-fix-permissions-demo.sh` to something more indicative.

4. Correct the symbolic link in `bin/` to new name of `scripts/networking/ssh-fix-permissions-demo.sh` from the previous step.
