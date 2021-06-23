#!/bin/sh


# BEGINNING
{
	# Any subsequent(*) commands which fail will cause the shell script to exit immediately
	set -e;
	#echo "Script executed from: $(pwd)";
};

# SCRIPT SETTINGS
{
	file_name="tree";
	path_input_file="src/$file_name.dot";
	path_output_file="out/$file_name";
	path_log_file="out/compile_datetime.txt";
	graphviz_app_file="dot";
};


# APP INSTALLATION CHECK
{
	echo "Checking Graphviz installation...";
	if [ ! type $graphviz_app_file &> /dev/null ]; then
		echo "FATAL ERROR!";
		echo " ^- Graphviz seems does not installed";
		echo " ^- Please install it by command: \"sudo apt-get install graphviz libgraphviz-dev pkgconfig\"";
		echo "----------------------------------------";
		exit 1;
	else
		echo "^- Seems to be installed, processing.";
	fi;
	echo "Getting information about Graphviz app...";
	$graphviz_app_file -V;
	type $graphviz_app_file;
};


# SETTINGS PRINT
{
	cd ./../;
	echo "----------------------------------------";
	echo " [ Used variables ]";
	echo " ^- Input file name:  \"$file_name\"";
	echo " ^- Project dir:      \"$(pwd)\"";
	echo " ^- Input file path:  \".$path_input_file\"";
	echo " ^- Output file path: \".$path_output_file\"";
	echo " ^- Log file path:    \".$path_log_file\"";
};


# GRAPHS COMPILING
{
	echo "----------------------------------------";
	echo " [ Graphs Compiling ]";
	echo " ^- [1/2] \".svg\" file generating..";
	$graphviz_app_file -Tsvg "$(pwd)/$path_input_file" > "$(pwd)/$path_output_file.svg";

	echo " ^- [2/2] \".png\" file generating..";
	$graphviz_app_file -Tpng "$(pwd)/$path_input_file" > "$(pwd)/$path_output_file.png";
};


# LOGS PROCESSING
{
	echo "----------------------------------------";
	echo " [ Log file generating ]";
	echo " ^- Date record should been created..";
	date "+%d/%m/%y" > "$(pwd)/$path_log_file";
	echo " ^- Time record should been created..";
	date "+%H:%M"   >> "$(pwd)/$path_log_file";
};


# END
{
	echo "Goodbye!";
	exit $?;
};
