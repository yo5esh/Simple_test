/** Boundled Buffer  Producer 
 * consumer Problem Using Mutex Lock
 * @file 
 * @author your name (you@domain.com)
 * @brief  : Solving Boundled Buffer Problem Using Mutex Lock 
 * @version 0.1
 * @date 2019-03-02
 * 
 * @copyright Copyright (c) 2019
 * 

 */
#include<bits/stdc++.h>
#include<pthread.h>

pthread_mutex_t mutex;

/*  Create and Initialize The mutex lock */

pthread_mutex_init(&mutex,NULL);
/** create and initialize the mutex lock */

pthread_mutex_lock(&mutex);/** acquire the mutex lock */

pthread_mutex_unlock(&mutex);  /** release the mutex lock */

int main()
{

}