# Phenogeno_Viz

## About the problem
![alt text](/images/Problem.png)

## Work Flow
![alt text](/images/Flowchart.png)

## Dependencies

* Ruby 2.5.1
* Rails 5.2.2
* R (latest version)
* Python 3
* C

## Installation

**1. Install Ruby on Rails**

The instructions for installing Ruby on Rails on Windows 10, Ubuntu, and OS X can be seen [here](https://github.com/tbsvttr/install-ruby-and-rails) and should be similar for different OS versions.

**2. Get the web app**

    git clone https://github.com/NCBI-Hackathons/Phenogeno_Viz.git

**3. Compile and install the Ruby C Extension**

    $ cd Phenogeno_Viz/webapp/ext/datavis/ext/
    $ sudo bash updt.sh

**4. Prepare the web server**

    $ bundle update
    $ bundle install

**5. Deploy the web server**

    $ rails s

**Note: Unless configured, the web server will use port 3000**

