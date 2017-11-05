# bmp2ROM
Little Matlab code that catch a bmp image and transform it to a list of 8bit RGB. It also can be modded to output a 3bit RGB.

P.e.: an image with a 32x32 resolution will result in a 1024 vector with each word beaig a binary of 8bit coded like 3 bit Red, 3 bit Green and 2 bitBlue.

That's an usefull tool when adding images to ROMs like in an fpga. That was the reason why I make that code, to transfer .bmp pictures made with Photoshop to the ROM of https://github.com/Piruri/Pelesnake
