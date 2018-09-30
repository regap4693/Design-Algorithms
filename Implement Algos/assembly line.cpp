#include<iostream>
using namespace std;
void traversal(int x,int l1[],int l2[],int n)
{
     int i=n;
     for(i=1;i<n;i++)
     cout<<l1[i];
     cout<<endl;
     
     for(i=1;i<n;i++)
     cout<<l2[i];
     cout<<endl;
     while(i)
     {
     if(x==2)
     {
             cout<<"line "<<x<<" station "<<i<<endl;
             x=l2[--i];
             }
     else
     {
         cout<<"line "<<x<<" station "<<i<<endl;
         x=l1[--i];
         }
         }
         }
         
         
     
     void assembly(int e1,int e2,int x1,int x2,int a1[],int t1[],int a2[],int t2[],int n)
{
     int i,f1[100],f2[100],l1[100],l2[100];
     f1[0]=e1+a1[0];
     f2[0]=e2+a2[0];
     for(i=1;i<n;i++)
     {
                     if((f1[i-1]+a1[i])<=(f2[i-1]+t2[i-1]+a1[i]))
                     {
                      f1[i]=f1[i-1]+a1[i];
                      l1[i]=1;
                     }
                     else
                     {
                         f1[i]=f2[i-1]+t2[i-1]+a1[i];
                         l1[i]=2;
                         }
                         if((f2[i-1]+a2[i])<=(f1[i-1]+t1[i-1]+a2[i]))
                         {
                         f2[i]=f2[i-1]+a2[i];
                         l2[i]=2;
                         }
                         else
                         {
                             f2[i]=f1[i-1]+t1[i-1]+a2[i];
                             l2[i]=1;
                             }
                             }
     if((f2[n-1]+x2)<=(f1[n-1]+x1))
     traversal(2,l1,l2,n);
     else
     traversal(1,l1,l2,n);
     }
     
     int main()
     {
         int i,e1,e2,x1,x2,a1[100],a2[100],t1[100],t2[100],n;
         cout<<"\nenter the no. of stations"<<endl;
         cin>>n;
         cout<<"\nenter the entry time into 1st assembly line"<<endl;
         cin>>e1;
         cout<<"\nenter the entry timeinto 2nd assembly line"<<endl;
         cin>>e2;
         cout<<"\nenter the exit time from 1st assembly line"<<endl;
         cin>>x1;
         cout<<"\nenter the exit time from 2nd assembly line"<<endl;
         cin>>x2;
         cout<<"enter the assembly time for stations of assembly line1"<<endl;
         for(i=0;i<n;i++)
             cin>>a1[i];
         cout<<"enter the assembly time for stations of assembly line2"<<endl;
         for(i=0;i<n;i++)
         cin>>a2[i];
         cout<<"enter the transfer time for stations of assembly line1"<<endl;
         for(i=0;i<n-1;i++)
             cin>>t1[i];
         cout<<"enter the transfer time for stations of assembly line2"<<endl;
         for(i=0;i<n-1;i++)
         cin>>t2[i];
         assembly(e1,e2,x1,x2,a1,t1,a2,t2,n);
         system("PAUSE");
         
         return 0;
         }
         
