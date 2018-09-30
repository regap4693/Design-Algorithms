#include<iostream>
using namespace std;
struct vertex
{
       int par;
       int d;
       char info;
       int vn;
       };
       
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
       
       
void exchange(struct vertex &a,struct vertex &b)
{
             struct vertex temp;
             temp=a;
             a=b;
             b=temp;
                          }
                          
                          
void heapify(struct vertex a[30],int i,int size)
{
     int heapsize=size;
     int smallest,l,r;
     l=left(i);
     r=right(i);
     if((l<=heapsize)&&(a[l-1].d<a[i-1].d))
     {
     smallest=l;
} 
     else
     {smallest=i;
     }
     
     if((r<=heapsize)&&(a[r-1].d<a[smallest-1].d))
     smallest=r;
     
     if(smallest!=i)
     {
                   exchange(a[i-1],a[smallest-1]);
                   heapify(a,smallest,heapsize);
                   }
                   }
       
void heap_ins(struct vertex a[],int n)
{
     int i=n+1;
     while((i>1)&&(a[(parent(i))-1].d>a[i-1].d))
     {
     exchange(a[(parent(i))-1],a[i-1]);
     i=parent(i);
     }
     }
       
       
void pque_ins(struct vertex a[],int key,int par,int v,int &rear,int &front)
{
     if((rear==-1)&&(front==-1))
     {
                        front++;
                        a[++rear].d=key;
                        cin>>a[rear].info;
                        a[rear].par=par;
                        
                        
                        a[rear].vn=v;
                        }
                        else
                        {
                            if(rear==49)
                            cout<<"\nqueue is full"<<endl;
                            else
                            {
                                
                                a[++rear].d=key;
                                cin>>a[rear].info;
                                a[rear].par=par;
                                a[rear].vn=v;
                                heap_ins(a,rear);
                                }
                                }
                                }
                                
                                
vertex heap_delete(struct vertex a[],int rear,int front)
{
    struct vertex min;
    min=a[front];
    exchange(a[front],a[rear]);
    
    heapify(a,front+1,rear);
    return(min);
}
                                
                                
vertex extract_min(struct vertex a[],int &rear,int &front)
{
   struct vertex key;
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
                       
void build_heap(struct vertex a[],int n)
{
     for(int i=n/2;i>=1;i--)
     heapify(a,i,n);
     }
       
void vertex_init(struct vertex st[],int &rear,int &front,int n)
{
     int i;
     
     cout<<"\nenter the item of vertex 1";
     pque_ins(st,0,-1,1,rear,front);
     
     for(i=1;i<n;i++)
     {
                     
              cout<<"\nenter item of vertex "<<i+1;
              
              pque_ins(st,200000,0,i+1,rear,front);
              }
              }
              
     void dijikstra(int ad[][50],struct vertex st[],int n,int rear,int front,struct vertex s[])
     {
          struct vertex item;
          int i,j,k,c;
          c=0;
          while(rear!=-1)
          {
          item=extract_min(st,rear,front);
          s[c]=item;
          c++;
          cout<<endl;
          cout<<"extract min(q)"<<endl;
          cout<<"\nvertex no. :"<<item.vn;
                          cout<<"\ncost length :"<<item.d;
                          cout<<"\n parent:"<<item.par;
                          cout<<"\nitem:"<<item.info;
                          cout<<endl;
          
          for(i=0;i<n;i++)
          
          {
                          if((i+1)==item.vn)
                          {
                                            
                          for(j=0;j<n;j++)
                          {
                                          if(ad[i][j]>0)
                                          {
                                                        
                                                        for(int k=front;k<=rear;k++)
                                                        {
                                                                if(st[k].vn==(j+1))
                                                                {
                                                                                   cout<<"before change"<<endl;
                                                                                   cout<<"\nvertex no. :"<<st[k].vn;
                          cout<<"\ncost length :"<<st[k].d;
                          cout<<"\n parent:"<<st[k].par;
                          cout<<"\nitem:"<<st[k].info;
                          cout<<endl;
                          
                                                                                   if(st[k].d>(item.d+ad[i][j]))
                                                                                   {
                                                                                   cout<<"item.d="<<item.d<<"adj"<<ad[i][j]<<endl;
                                                                                      st[k].d=item.d+ad[i][j];
                                                                                      st[k].par=item.vn;
                                                                                      }
                                                                                      cout<<"after change"<<endl;
                                                                                      cout<<"\nvertex no. :"<<st[k].vn;
                          cout<<"\ncost length :"<<st[k].d;
                          cout<<"\n parent:"<<st[k].par;
                          cout<<"\nitem:"<<st[k].info;
                          cout<<endl;
                                                                                      }
                                                                                      }
                                                                                      }
                                                                                      }
                                                                                      build_heap(st,rear+1);
                                                                                      }
                                                                                      }
          
                          
                                                                                      }
                                                                                      }
                                                                                      
                                                                                      
                                       void shortest_path(struct vertex s[],struct vertex x,int n)
                                       {
                                            
                                                       
                                            for(int i=0;i<n;i++)
                                            {
                                                    if(s[i].vn==x.par)
                                                    {
                                                                      shortest_path(s,s[i],n);
                                                                      cout<<"=>"<<x.info;
                                                                      }
                                                                      
                                                                      
                                                                                         }
                                                                                         }              
                                                                                         
                                                                                                 
                                                                                      
                                                                                   
                                          
                        
                                      
int main()
{
    struct vertex st[50],s[50];
    int vno,ad[50][50],i,j,front,rear;
    front=rear=-1;
    cout<<"\nenter the no. of vertices";
    cin>>vno;
    cout<<"\nenter the adjacency matrix row wise";
    for(i=0;i<vno;i++)
    {
                      cout<<"\nfor row"<<i+1;
                      for(j=0;j<vno;j++)
                      cin>>ad[i][j];
                      }
                      vertex_init(st,rear,front,vno);
                      dijikstra(ad,st,vno,rear,front,s);
                      cout<<endl;
                      cout<<"shortest path single source=>"<<endl;
                      for(i=1;i<vno;i++)
                      {
                                        cout<<s[i].info<<" : "<<s[0].info;
                                        shortest_path(s,s[i],vno);
                                        cout<<endl;
                                        }
                      
                     
                      system("PAUSE");
                      return 0;
                      
                      }
                      
                      
                      
