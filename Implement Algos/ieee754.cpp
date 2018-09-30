#include<iostream>
using namespace std;

int binary(int n,int b[])
{
     int i=0,s;
     int bin[50];
     if(n<=1)
     {
             s=1;
             b[0]=n;
             return(s);
             }
             else
             {
                 
             
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

}

void bindecimal(float d,int bde[])
{
    float x=d;
    for(int i=0;i<24;i++)
    {
            float z=x*2;
            int g=(int)z;
            x=z-g;
            bde[i]=g;
            
            }
            cout<<endl;
            }



int main()
{
    float n;
    cin>>n;
    
    int fp[32];
    if(n<0)
    fp[0]=1;
    else
    fp[0]=0;
    if(n<0)
    n=-n;
    
    int in=(int)n;
    
    float de=n-in;
    
    int bin[50];
    int bde[24];
    int a;
    int intlen=binary(in,bin);
    
    
    bindecimal(de,bde);
    
    int man[23];
    int exp;
    int x=bin[0];
    
    if((x==1)&&(intlen>1))
    {
                          
    int k=0;
    for(int h=0;h<24;h++)
    {
            if(h<intlen)
            man[h]=bin[h];
            else
            {
                man[h]=bde[k];
                k++;
                }
                }
    
    exp=intlen-1+127;
}
    else
    {
        if((x==0)&&(intlen==1))
        {
                               for(a=0;a<23;a++)
                               {
                                       if(bde[a]==1)
                                       break;
                                       }
                                       exp=127-(a+1);
                                       int g=0;
                                       for(int i=a;i<23;i++)
                                       {
                                               man[g]=bde[i];
                                               g++;
                                                  }
                                               for(int i=g;i<24;i++)
                                               man[i]=0;
                                       
                                       }
                                       else
                                       {
                                           man[0]=1;
                                           int k=0;
                                           for(int i=1;i<24;i++)
                                           {
                                                   man[i]=bde[k];
                                                   k++;
                                                   }
                                           
                                       exp=127;
                                       }
                                       }
                                       
    int bexp[8],bfexp[50];
    int x2=binary(exp,bexp);
    if(x2<8)
    {
            for(int i=x2;i<8;i++)
            bexp[i]=0;
            int k=0;
            for(int i=7;i>=0;i--)
            {
                    bfexp[i]=bexp[k];
                    k++;
                    }
                    
                    for(int i=0;i<8;i++)
                    bexp[i]=bfexp[i];
}

    
    
 
    
    
cout<<endl;

for(int p=1;p<24;p++)
{
        man[p-1]=man[p];
        }
        


      int w=0;      
    for(int c=1;c<24;c++)
    {
            fp[c]=man[w];
            w++;
            }
            
            int j=0;
            for(int u=24;u<32;u++)
            {
                    fp[u]=bexp[j];
                    j++;
                    }
                    
         cout<<"the corresponding ieee 754 floating point form is=>"<<endl;   
    for(int i=0;i<32;i++)
    cout<<fp[i];
    cout<<endl;
    
    
    system("PAUSE");
    return 0;
    
}
