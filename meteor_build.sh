#!/bin/bash

# Scaffolding tool for Meteor Apps
# Defines structure for basic projects

# Possible dir paths
collectionsDirPath="lib\collections"
stylesheetsDirPath="client\stylesheets"
templatesDirPath="client\templates"
applicationDirPath="client\templateemplates\application"
includesDirPath="client\templates\includes"
# Possible file paths
styleCssPath="client\stylesheets\style.css"
mainHtmlPath="client\main.html"
layoutHtmlPath="client\templates\application\layout.html"
layoutJsPath="client\templates\application\layout.js"
notFoundHtmlPath="client\templates\application\not_found.html"
accessDeniedHtmlPath="client\templates\includes\access_denied.html"
headerHtmlPath="client\templates\includes\header.html"
headerJsPath="client\templates\includes\header.js"
loadingHtmlPath="client\templates\includes\loading.html"
routerJsPath="lib\router.js"
permissionsJsPath="lib\permissions.js"
fixturesJsPath="server\fixtures.js"
publicationsJsPath="server\publications.js"


# Functions
function showMenu {
	echo "Choose a scaffold:
		(1) iOS -- Not Done
		(2) Android -- Not Done
		(3) All Mobile
		(4) Web Only -- Not Done
	"
}

function setUpFileAndContent {
	touch $1
	printf "%s" $2 >> $1
}

function removeGenFiles {
	echo "Removing meteor create files..."
	rm $appName.*
}

function createClientDir {
	echo "Creating directories: \client \server \lib \public"
	mkdir "client"
	mkdir "server"
	mkdir "lib"
	mkdir "public"
}

function setUpClient {
	echo "Setting up client directories and files..."

	mkdir $stylesheetsDirPath
	mkdir $templatesDirPath
	mkdir $applicationDirPath
	mkdir $includesDirPath

	setUpFileAndContent $styleCssPath "/* style.css */"
	# Setup for responsive applications
	setUpFileAndContent $mainHtmlPath "<head>
		<title>$appName</title>
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"/>
	</head>"
	setUpFileAndContent $layoutHtmlPath "<template name=\"layout\">
	</template>"
	setUpFileAndContent $layoutJsPath ""
	setUpFileAndContent $notFoundHtmlPath "<template name=\"notFound\">
	</template>"
	setUpFileAndContent $accessDeniedHtmlPath "<template name=\"accessDenied\">
	</template>"
	setUpFileAndContent $headerHtmlPath "<template name=\"header\">
	</template>"
	setUpFileAndContent $headerJsPath ""
	setUpFileAndContent $loadingHtmlPath "<template name=\"loading\">
	</template>"
}

function setUpLib {
	echo "Setting up lib directories and files..."

	mkdir $collectionsDirPath

	setUpFileAndContent $routerJsPath "Router.configure({
		layoutTemplate: \"layout\",
		loadingTemplate: \"loading\",
		notFoundTemplate: \"notFound\"
	});"
	setUpFileAndContent $permissionsJsPath ""
}

function setUpServer {
	echo "Setting up server directories and files..."

	setUpFileAndContent $fixturesJsPath ""
	setUpFileAndContent $publicationsJsPath ""
}

function generateMobile {
	echo "Generating mobile Meteor app..."

	removeGenFiles
	createClientDir
	setUpClient
	setUpLib
	setUpServer

	echo "Setup complete!"
}


# Start
showMenu
read -p "Selection: " selection
read -p "What is your app's name: " appName

if [ $selection -eq "3" ] 
then
	generateMobile
fi

