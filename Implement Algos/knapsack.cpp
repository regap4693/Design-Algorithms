#include<iostream>
using namespace std;

void knapsack(int W,int n,int m[],int b[],int v[][50])
{
     for(int w=0;w<=W;w++)
     v[0][w]=0;
     for(int i=1;i<=n;i++)
     v[0][i]=0;
     for(int i=1;i<=n;i++)
     {
             for(int w=1;w<=W;w++)
             {
                     if(m[i-1]<=w)
                     {
                                  if((b[i-1]+v[i-1][w-m[i-1]])>(v[i-1][w]))
                                  
                                       v[i][w]=v[i-1][w-m[i-1]];
                                  else
                                        v[i][w]=v[i-1][w];
                                        }
                                        else
                                        v[i][w]=v[i-1][w];
                                        }
                                        }
                                        }
                                        
                                        
void print_item(int n,int W,int m[],int v[][50])
{
     for(int i=n,w=W;i>=0,w>=0;)
     {
                      if(v[i][w]==v[i-1][w])
                      i=i-1;                                                         
                      else
                      {
                          cout<<i<<" ";
                          i=i-1;
                          w=w-m[i-1];
                          }
                          }
                          }
                          
int main()
{
    int n,W,m[50],b[50],v[50][50];
    cout<<"\nenter the no. of items";
    cin>>n;
    cout<<"\nenter the weight of the knapsack";
    cin>>W;
    cout<<"\nenter the profit";
    
    for(int i=0;i<n;i++)
    {       
            
            cin>>b[i];
            
            }
            
    cout<<"\nenter the weight";
            for(int i=0;i<n;i++)
    {       
            
            cin>>m[i];
            
            }
            
            knapsack(W,n,m,b,v);
            
    for(int i=0;i<=W;i++)
    {
            for(int j=0;j<=n;j++)
            {
                             cout<<v[i][i]<<" ";
                             }
                             cout<<endl;
                             }
                             
    cout<<endl;
    print_item(n,W,m,v);
    system("PAUSE");
    return 0;
}
