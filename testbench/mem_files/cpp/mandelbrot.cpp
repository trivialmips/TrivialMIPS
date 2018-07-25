#include "mips.h"

int _entry()
{
    int w = 600, h = 400, x, y; 
    //each iteration, it calculates: newz = oldz*oldz + p, where p is the current pixel, and oldz stars at the origin
    float pr, pi;                   //real and imaginary part of the pixel p
    float newRe, newIm, oldRe, oldIm;   //real and imaginary parts of new and old z
    float zoom = 1, moveX = -0.5, moveY = 0; //you can change these to zoom and change position
    int maxIterations = 255; //after how much iterations the function should stop

	send_serial_str("P3\n600 400\n255\n");

	//loop through every pixel
	for(y = 0; y < h; y++)
	{
		for(x = 0; x < w; x++) 
		{
			// calculate the initial real and imaginary part of z, based on the pixel location and zoom and position values
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
			pi = (y - h / 2) / (0.5f * zoom * h) + moveY;
			newRe = newIm = oldRe = oldIm = 0; //these should start at 0,0
			//"i" will represent the number of iterations
			int i;
			//start the iteration process
			for(i = 0; i < maxIterations; i++)
			{
				//remember value of previous iteration
				oldRe = newRe;
				oldIm = newIm;
				//the actual iteration, the real and imaginary part are calculated
				newRe = oldRe * oldRe - oldIm * oldIm + pr;
				newIm = 2.0f * oldRe * oldIm + pi;
				//if the point is outside the circle with radius 2: stop
				if((newRe * newRe + newIm * newIm) > 4) break;
			}

			int color = i * 255 / maxIterations;
			send_serial_integer(color);
			send_serial_char(' ');
			send_serial_integer(color);
			send_serial_char(' ');
			send_serial_integer(color);
			send_serial_char(' ');
		}
		send_serial_char('\n');
	}

	return 0;
}
