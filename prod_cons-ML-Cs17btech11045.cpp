/**
 * @file Sloving Bounded Buffer  
 * Producer-Consumer Problem using Semaphores 
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2019-03-02
 * @copyright Copyright (c) 2019
 * 
 */
// https://github.com/stevelyall/producerconsumer3410/blob/master/producerconsumer.c

#include<bits/stdc++.h>
#include<time.h>
#include<pthread.h>
#include<unistd.h>
#include<string.h>
#include<random>
#include<sys/time.h>
#include<chrono>
#include<ratio>
#include<time.h>
#include<ctime>
#include<fstream>
#include<mutex>

#define BUFFER_SIZE 4
#define FULL 0
#define EMPTY 0
using namespace std;


std::default_random_engine generator;
int buffer[BUFFER_SIZE];

pthread_mutex_t mutex_count;

int np, nc, t1, t2, p, c;

/**
 * Defining empty for Producer semaphore. 
 * Defining full for  Consumer Semaphore.
 */

/** Create the semaphore and initialize it to 1 */ 

int in = 0;
int out = 0;
void *Producer(void *param);
void *Consumer(void *param);

typedef string  timestamp_t;
static timestamp_t 

get_timestamp()
{
    time_t     now = time(0);
    struct tm  tstruct;
    char  buff[80];
    tstruct = *localtime(&now);
    // Visit http://en.cppreference.com/w/cpp/chrono/c/strftime
    // for more information about date/time format
    strftime(buff, sizeof(buff), " %X", &tstruct);

    return buff;
}


/*
get_timestamp()
{
   std::time_t result = std::time(nullptr);
   std::cout<<std::asctime(std::localtime(&result))<<result<<endl;
}
*/

int main()
{ 
    ifstream r; /// stream class to Read from file.
    fstream wr; /// stream class to Write on file.
    r.open("in-params.txt");
    r>>np>>nc>>t1>>t2>>p>>c;

    pthread_t tp[np];
    pthread_t tc[nc];

    std::exponential_distribution<double> d1(1/t1);
    std::exponential_distribution<double> d2(1/t2);
     
     pthread_attr_t attr; /** Set of Thread attributes */
     pthread_attr_init(&attr); /** get the default attribution*/

     /** Create n threads for producer  */
    
    
     for(int i=1;i<=np;i++)
     {
         pthread_create(&tp[i],&attr,Producer,NULL);
     }
        /** Create n threads for Consumer  */
      for(int i=1;i<=nc;i++)
     {
         pthread_create(&tc[i],&attr,Consumer,NULL);
     }
     /// Joining threads 
     for(int i=1;i<=np;i++)
     {
         pthread_join(tp[i], NULL);
     }
     for (int i = 1; i<=nc; i++)
     {
         pthread_join(tc[i], NULL);
     }
     
    pthread_exit(NULL);

     return 1;

}

void *Producer( void *param)
{
 int i,item;
  
  item = 0;
  int m =0;

 timestamp_t t0;

 for(int i=0;i<np;i++)
 { 
      
      pthread_mutex_lock(&mutex_count);
    /** if Buffer is empty then we will wait till the 
     * the Buffer gets some Instance.
     */
    buffer[in] = item;
    in = (in+1)%BUFFER_SIZE;
    
     item = item+1;
     m = m+1;
    t0 = get_timestamp();

    cout<<i<<"  th item  "<<item<<" produced by thread at id  Into Buffer "<<t0<<" location "<<m<<endl;//<<m;
   
    sleep(t1);

   pthread_mutex_unlock(&mutex_count);

 }
}

void *Consumer(void *param)
{  
    int i,item;
    
    item = 0;
    int m =0;
    timestamp_t t1;
    for(int i=0;i<nc;i++)
    {   
         pthread_mutex_lock(&mutex_count);
       /// If buffer is full then wait untill it get empty.
        
        item  = buffer[out];
        out = (out+1)%BUFFER_SIZE;

        item = item+1;
        m  = m+1;
        t1 = get_timestamp();
         cout<< i << " th item " << item << " Consumed by thread at " <<t1<< " Into Buffer location  "<<m<<endl;//<< m;
          
          sleep(t2);
          pthread_mutex_unlock(&mutex_count);
    }
}
