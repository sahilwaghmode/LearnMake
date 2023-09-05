#include<iostream>
#include"time.h"
using namespace std;

void CalculateDate();
int main()
{
	int i = 0 ;
	cout<< i++ << "\t";
	cout << i << endl;
	cout << "Hello Mac !" << endl;
	 CalculateDate();
	TimeUtils::now();
//	TimeUtils::systemTime();
//	TimeUtils::strTime();
	return 0;
}
