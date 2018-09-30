#include<iostream>
 using namespace std;
 int remove(int arr[],int key,int count,int j)
 {
     int k=count;
     for(int i=0;i<j;i++)
     {
             if((k==count)&&(arr[i]==key))
             {
                                          count++;
                                          arr[i]=0;
                                          }
             else
             {
                 if((k!=count)&&(arr[i]==key))
                 {
                                              arr[i]=0;
                                              }
                                              }
                                              }
                                              return(count);
                                              }
                                              
 
 int make(int ch,int inp[],int &n)
 {
     int count=0;int shelf[50];
     int j=0;
     int d=0;
     int flag=0;
     for(int i=n-1;i>=0;i--)
     {
             if(inp[i]==ch)
             {
                           d=i+1;
                           flag=1;
     }
     }
     if(flag==1)
     {
                for(int i=n-1;i>=d;i--)
     {
             if(inp[i]!=ch)
             {
                       shelf[j]=inp[i];    
                           j++;
                           }
                           }
                           int arr[50];
                           
                           for(int i=j-1;i>=0;i--)
                           arr[i]=shelf[i];
                           int p=d-1;
                           for(int i=j-1;i>=0;i--)
                           {
                                   inp[p]=shelf[i];
                                   p++;
                                   count=remove(arr,shelf[i],count,j);
                                   }
                                   n=p;
                                   return(count);
                                   } 
                                   else
                                   return(-1);
                                   }
                                   
 
 
 int main()
 {
     char inp1[50];
     int res[50],inp[50];
     printf("\nenter the no.of packetsin shelf");
     int n;
     cin>>n;
     for(int i=0;i<n;i++)
     cin>>inp1[i];
     
     for(int i=0;i<n;i++)
     inp[i]=inp1[i];
     
     char in[50];
      int k=0;
     for(char ch=65;ch<=90;ch++)
     {
              res[k]=make(ch,inp,n);
              for(int i=0;i<n;i++)
       {
              in[i]=inp[i];
               cout<<in[i]<<" ";
               
               }
               cout<<endl;
              
               k++;
               }
       int max=res[0];
       for(int i=0;i<k;i++)
       {
               cout<<res[i]<<" ";
               
               }
               cout<<endl;
       
       for(int i=1;i<k;i++)
       {
               if(res[i]>max)
               max=res[i];
               }
               cout<<"the no.of shelves needed are=>"<<max;
                     system("PAUSE");
                           return 0;
                           }
                                     
