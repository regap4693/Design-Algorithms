#include<iostream>
using namespace std;
#include<Math.h>
int binary(int n,int b[])
{
     int i=0;
     int bin[50];
     while(n>0)
     {
               bin[i]=n%2;
               n=n/2;
               i++;
               }
               int k=i-1;
               for(int j=0;j<i;j++)
               {
                       b[j]=bin[k];
                       k--;
                       }
                       
               return(i);
               }
               int cal(int b[],int c,int car)
               {
                    
                            for(int i=c-1;i>=0;i--)
                            {
                                    if((b[i]==1)&&(car==1))
                                    {
                                                           b[i]=0;
                                                           car=1;
                                                           }
                                                           else
                                                           {
                                                               if(((b[i]==1)&&(car==0))||((b[i]==0)&&(car==1)))
                                                           {
                                                                                                            b[i]=1;
                                                                                                            car=0;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                b[i]=0;
                                                                                                                car=0;
                                                                                                            }
                                                                                                            }
                                                                                                            }
                                                                                                            if(car==1)
                                                                                                            {for(int i=c;i>=0;i--)
                                                                                                            b[i]=b[i-1];
                                                                                                            
                                                                                                            b[0]=car;
                                                                                                            c++;
                                                                                                            }
                                                                                                            return(c);
                                                                                                            
                                                                                                            }
                    
               int twoscomp(int b[],int c)
               {
                    for(int i=0;i<c;i++)
                    {
                            if(b[i]==0)
                            b[i]=1;
                            else
                            b[i]=0;
                            }
                           
                          int j=cal(b,c,1);
                          
                          return(j);
                          }
                            
                                                                           
                                                                                                            
     void extend(int b[],int k,int x,int c)
     {
           int arr[50];
               for(int i=0;i<(k-c);i++)
               {
                    arr[i]=x;
                    } 
                    int j=0;
                    for(int i=k-c;i<k;i++)
                    {
                            arr[i]=b[j];
                            j++;
                            }  
                                                       
                            for(int i=0;i<k;i++)
                            b[i]=arr[i];
                           
                           
                            }
                            
               int toadd(int car[],int m[],int z,int c)
               {
                   if(z==-1)
                   {
                            for(int i=0;i<c;i++)
                            car[i]=m[i];
                            
                            twoscomp(car,c);
                            }
                            else
                            {
                                if(z==1)
                                {
                                      for(int i=0;i<c;i++)
                                      car[i]=m[i];  
                                      }
                                      
                                      else
                                      {
                                          for(int i=0;i<c;i++)
                                      car[i]=0;
                                      }
                                      }
                                      return(car[0]);
                                      }
                                        
              int adds(int car[],int cc,int pp[],int ccar)
              {
                  int k=0;
                  
                  
                  for(int i=(2*ccar)-1;i>=0;i--)
                  {
                         for(int j=0;j<(2*ccar);j++)
                   cout<<car[j];
                   cout<<endl;
                          int h=cal(car,cc-k,pp[i]);
                          cc=h+k-1;
                          
                          
                          k++;
                          }
                          return(cc);
                          }
                          
                    

                     int add(int car[],int cc,int pp[],int ccar,int g)
               {
                         
                         
                         int k=g;
                         while(k>0)
                         {      
                         for(int i=1;i<(2*ccar);i++)
                         {
                                 pp[i-1]=pp[i];
                    
                    }                     
                    k--;
                    
                     
                    }
                   
                   //cout<<endl<<"c="<<cc<<endl;
                    
                    for(int i=(2*ccar)-g;i<(2*ccar);i++)
                    {
                            pp[i]=0;
                            }
                           
                             
                         int len=adds(car,cc,pp,ccar);
                         return(len);
                            
                            }   
                            
                            
                           
                                 
                            
                            
                    int decimalc(int bin[],int c)
                    {
                        int dec=0;
                        int in=0;
                        for(int i=c;i>0;i--)
                        {
                                dec=dec+((pow(2,in))*bin[i]);
                                in++;
                                }
                               
                                if(bin[0]==1)
                                return((-dec));
                                else
                                return(dec);
                                }
                                
                                
                    
                            
               int main()
               {
                   int n1,n2;
                   cin>>n1;
                   cin>>n2;
                   
                   int m[50];
                   int q[50];
                   
                   
                   
                   int cm,cq;
                   if(n1<0)
                   {
                           cm=binary(-n1,m);
                           
                   }
                   else
                   cm=binary(n1,m);
                  
                 
                   
                   if(n2<0)
                   {
                           cq=binary(-n2,q);
                           
                           }
                           else
                           cq=binary(n2,q);
                           
                        
                   
                  
                   int max=cq;
                   if(cm>max)
                   max=cm;
                   
                   if(max==cq)
                   extend(m,cq,0,cm);
                   else
                   extend(q,cm,0,cq);
                   
                   if(n1<0)
                    twoscomp(m,cm);
                  
                  if(n2<0)
                   twoscomp(q,cq);
                  
                  
                  int p[50];
                  int pr=0;
                  int k=max-1;
                  for(int i=0;i<max;i++)
                  {
                         if((q[k]==1)&&(pr==0))
                             p[i]=-1;
                             else
                             {
                                 if((q[k]==0)&&(pr==1))
                                 p[i]=1;
                                 else
                                 p[i]=0;
                                 }
                                 
                                 pr=q[k];
                                 k--;
                                 }
                                 
                  
                  
                   
               int car[50];                  
               int fbit=toadd(car,m,p[0],max);
              
               
               extend(car,2*max,fbit,max);
                
               
               int pp[50];
               int cc=2*max;
              for(int i=1;i<max;i++)
              {
                      
               fbit=toadd(pp,m,p[i],max);
               extend(pp,2*max,fbit,max);
               
                  cc=add(car,cc,pp,max,i);
                
               }
                
                          cout<<"\ntest"<<endl;
                     for(int j=0;j<cc;j++)
                   cout<<car[j];
               
               
               int n=decimalc(car,cc);
                          cout<<"\nproduct is=>"<<n<<endl;
                           
                           
                          
                           
                           system("PAUSE");
                           return 0;
                           }
                           
                   
               
