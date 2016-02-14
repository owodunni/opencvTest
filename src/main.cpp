#include <highgui.h>
#include <iostream>
using namespace std;

int main(int argc, char** argv){
	IplImage* img = cvLoadImage(argv[1]);
	
	cvNamedWindow(argv[1],CV_WINDOW_AUTOSIZE);
	cvShowImage(argv[1],img);
	cvWaitKey(0);
	cvReleaseImage(&img);
	cvDestroyWindow(argv[1]);

}
