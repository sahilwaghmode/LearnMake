#include<ctime>
#include<chrono>
#include"time.h"

namespace TimeUtils
{
using namespace std;
void now()
{
	time_t curr_time;
	curr_time = time(NULL);

	tm *tm_local = localtime(&curr_time);
	cout << "Current local time : " << tm_local->tm_hour << ":" << tm_local->tm_min << ":" << tm_local->tm_sec;
}

void systemTime()
{
	const std::chrono::time_point<std::chrono::system_clock> now = std::chrono::system_clock::now();
	const std::time_t t_c = std::chrono::system_clock::to_time_t(now);
	std::cout << "System clock is at " << std::ctime(&t_c);
}

void diffTime(time_t start, time_t finish)
{
	cout << "Time required " << difftime(finish, start) << endl;
}

void timeStr()
{
	time_t curr_time;
	tm * curr_tm;
	char date_string[100];
	char time_string[100];
	
	time(&curr_time);
	curr_tm = localtime(&curr_time);
	
	strftime(date_string, 50, "Today is %B %d, %Y", curr_tm);
	strftime(time_string, 50, "Current time is %T", curr_tm);
	
	cout << date_string << endl;
	cout << time_string << endl;
}
}	
