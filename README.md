Vim RuboCop Auto9
================

Introduction
------------

The RuboCop Auto9 is a plugin to run [rubocop](https://github.com/bbatsov/rubocop) inside vim. Users can see suggestions in a display to improve their code style outlined in the community Ruby Style Guide. The plugin runs on current opened file and can also automatically fix some problems through rubocop.

![RuboCop-Auto9 Screenshot](https://raw.githubusercontent.com/rfdavid/rubocop-auto9/master/screenshot.gif)

Requirements
------------

This plugin was tested using rubocop 0.49.1. Previous (not so old) versions should work as well.

Installation
------------

#### Pathogen

    git clone https://github.com/rfdavid/rubocop-auto9 ~/.vim/bundle/rubocop-auto9

#### Vundle

Place into your .vimrc:

    Plugin 'rfdavid/rubocop-auto9'

And execute `:PluginInstall`

Usage
-----

Load any ruby file in your editor and press <Leader>9 (\9) or run the following commands:

    :RuboCopAuto9
    :RuboCopAuto9Correct

Shortcuts in the quickfix window:
Shortcut|Description
--- | ---
f | auto-correct the file
o | go to the line and close the quickfix window
q |close the quickfix window
