
# morphs Chia-key-finder

This is the first version of morphs chia-key-finder. At the current state, it uses 32 threads of a 16 core CPU. You will have to edit the files manually to reduce this usage.

Quickstart Guide:

If you have a 16 Core / 32 Threads, congratulations, you dont have to change anything.

1. You start by installing 32 different instances of Chia. Use the the included install-chiassssss.sh script for this.

2. To start the show, just run keyfinder.sh

This will start instances of keygen.sh with the coresponding Chia Instance and will generate keys.

3. Stop the show by creating a file called "stop.file" in the chia-key-finder directory. I included a file already. 

You can use it by issueing "mv stop.file.deactivated stop.file" 

If you dont have a 16 Core / 32 Thread CPU, you have to edit "install-chiassssss.sh" and "keyfinder.sh" accordingly.

You have to remove "taskset" lines until you have the number of cores/threads you have.

"taskset -c 0 ./keygen.sh 1 &"

taskset = sets the thread being used my the instance of keygen.sh

-c 0 = thread being used. We start to count at 0

./keygen.sh = script to called

1 = Instance of the chia client to be used, we start to count at 1

& = put task in the background, so we dont have to wait until this task is finished

Edit install-chiassssss.sh

this script will clone a single instance of Chia 1.6.1 into chia-blockchain1, copy that version to X instances and install them all.

if you have have less than 32 threads change the first "{2..32}" to "{2..how-many-threads-you-have}"

dont forget to change the other for loops the same way. If you have 8 Threads for example, you can delete or comment the second for loop out and only use the first one.
If you have 128 threads for example, change the second for "{10..32}" to "{10..128}"




