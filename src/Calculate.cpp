#include<iostream>
#include<ctime>

void CalculateDate()
{
	time_t now = time(0);
	std::cout << ctime(&now) << std::endl;
}
