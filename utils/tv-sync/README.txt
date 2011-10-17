This script will make a script to download new TV series from a server,
based on which ones you have seen already. This is determined by looking
in a folder for TV series files and parsing the name, season and episode.
It will by default download episodes from series you have seen one episode
from before and that are newer than the latest you have seen before.

Usage:

./makeQueue.sh <seenSeries> <tvServer> <tvRoot>

The script will output a list of files.

Usage example:
./makeQueue.sh /home/emh/movies tvserver /server/series > queue.txt

To download customize and run downloadQueue:
./downloadQueue.sh < queue.txt
