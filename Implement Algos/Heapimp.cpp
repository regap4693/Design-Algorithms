#include<iostream>
using namespace std;
int left(int i)
{
    return(2*i);
}

int right(int i)
{
    return((2*i)+1);
}

int parent(int i)
{
    
    return(i/2);
    
}

void exchange(int &a,int &b)
{
             int temp;
             temp=a;
             a=b;
             b=temp;
             }
             
void heapify(int a[30],int i,int size)
{
     int heapsize=size;
     int largest,l,r;
     l=left(i);
     r=right(i);
     if((l<=heapsize)&&(a[l-1]>a[i-1]))
     {
     largest=l;
} 
     else
     {largest=i;
     }
     
     if((r<=heapsize)&&(a[r-1]>a[largest-1]))
     largest=r;
     
     if(largest!=i)
     {
                   exchange(a[i-1],a[largest-1]);
                   heapify(a,largest,heapsize);
                   }
                   }
                   
void build_heap(int a[30],int n)
{
     for(int i=n/2;i>=1;i--)
     heapify(a,i,n);
     }
     

void heap_ins(int a[30],int n)
{
     int i=n+1;
     while((i>1)&&(a[(parent(i))-1]<a[i-1]))
     {
     exchange(a[(parent(i))-1],a[i-1]);
     i=parent(i);
     }
     }
                  
     
     
void pque_ins(int a[30],int key,int &rear,int &front)
{
     if((rear==-1)&&(front==-1))
     {
                        front++;
                        a[++rear]=key;
                        }
                        else
                        {
                            if(rear==29)
                            cout<<"\nqueue is full"<<endl;
                            else
                            {
                                a[++rear]=key;
                                heap_ins(a,rear);
                                }
                                }
                                }
                                
int heap_delete(int a[30],int rear,int front)
{
    int max;
    max=a[front];
    exchange(a[front],a[rear]);
    for(int i=front;i<=rear;i++)
                  cout<<a[i]<<" ";
                  cout<<endl;
    heapify(a,front+1,rear);
    return(max);
}


int pque_delete(int a[10],int &rear,int &front)
{
   int key;
        if(rear==front)
        {
                        key=heap_delete(a,rear,front);
                       rear=front=-1;
                       }
                       else
                       { key=heap_delete(a,rear,front);
                       rear--;
                       }
                       return(key);
                       }
                       
void heapsort(int a[30],int rear)
{
     int h=rear+1;
     for(int i=rear+1;i>1;i--)
     {
    exchange(a[0],a[h-1]);
     h--;
     heapify(a,1,h);
}
}

int main()
{
    int a[30],n,front,rear,key,item;
    front=rear=-1;
    while(1)
    {
    cout<<"\nenter any choice:\n1:insert\n2:delete\n3:sort\n4:display\n5:exit"<<endl;
    cin>>n;
    switch(n)
    {
             case 1:cout<<"\nenter the element's priority"<<endl;
                  cin>>key;
                  pque_ins(a,key,rear,front);
                  break;
             case 2:item=pque_delete(a,rear,front);
                  cout<<"\ndeleted item="<<item<<endl;
                  break;
             case 3:heapsort(a,rear);
                  break;
             case 4:for(int i=front;i<=rear;i++)
                  cout<<a[i]<<" ";
                  cout<<endl;
                  break;
             case 5:exit(0);
             default:cout<<"\n wrong choice"<<endl;
             }
                       
                       }             
    system("PAUSE");
    return 0;
}
