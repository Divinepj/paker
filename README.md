# paker

## Initialize Packer configuration
Initialize your Packer configuration.

`packer init .`

Packer will download the plugin you've defined above. In this case, Packer will download the Packer Amazon plugin that is greater than or equal to version 1.2.8.

You can run packer init as many times as you'd like. If you already have the plugins you need, Packer will exit without an output.

Packer has now downloaded and installed the Amazon plugin. It is ready to build the AMI!

## Format and validate your Packer template
We recommend using consistent formatting in all of your template files. The packer fmt command updates templates in the current directory for readability and consistency.

Format your template. Packer will print out the names of the files it modified, if any. In this case, your template file was already formatted correctly, so Packer won't return any file names.

`packer fmt .`

You can also make sure your configuration is syntactically valid and internally consistent by using the packer validate command.

Validate your template. If Packer detects any invalid configuration, Packer will print out the file name, the error type and line number of the invalid configuration. The example configuration provided above is valid, so Packer will return nothing.

`packer validate .`

## Build Packer image
Build the image with the `packer build {pkr_filename}` command.