#include<iostream>
using namespace std;
struct edge
{
       int terminal;
       struct edge *next;
       };



struct vertex
{
       char col;
       int par,d,f;
       char info;
       int vertno;
       struct vertex *next;
       struct edge *ed;
       };
       
struct edge* ins_edge(int n,struct edge *first)
{
      struct edge *temp,*t;
      temp=new struct edge;
      temp->terminal=n;
      temp->next=NULL;
      if(first)
      {
               for(t=first;t->next;t=t->next);
               
                          t->next=temp;
                          
                          return(first);
                          
                          }
                          else
                          return(temp);
                          }
                          
struct vertex* ins_vert(int n,int a[][50],struct vertex *head)
{
        int i,j;
        for(i=0;i<n;i++)
        {
                                      struct vertex *temp,*t;
                                       temp=new struct vertex;
                                       temp->col='w';
                                       temp->vertno=i+1;
                                       temp->par=0;
                                       cout<<"\nenter the item for vertex no."<<i+1<<endl;
                                       cin>>temp->info;
                                       for(j=0;j<n;j++)
                                       {
                                                       if(a[i][j]==1)
                                                       temp->ed=ins_edge(j+1,temp->ed); 
                                                       }
                                                       if(head)
                                                       {
                                                               for(t=head;t->next;t=t->next);
                                                                       t->next=temp;
                                                                          free(t);
                                                                          
                                                                          }
                                                                          
                                                                          else
                                                                          head=temp;
                                                                                                            }
                                       return(head);
                                       }
                                       
        
                                 
                                 
      
      
      void dfs_visit(struct vertex *t,struct vertex *head,int time)
      {
           struct vertex *v;
           struct edge *f;
           t->col='g';
           time++;
           t->d=time;
           for(f=t->ed;f;f=f->next)
           {
                      for(v=head;v;v=v->next)
                      {
                                 if(v->vertno==f->terminal)
                                 break;
                                 else
                                 free(v); 
                                 }
                                 if(v->col=='w')
                                 {
                                                
                                                v->par=t->vertno;
                                                dfs_visit(v,head,time);
                                                }
                                                }
           t->col='b';
           time++;
           t->f=time;
           }
           
           void dfs(struct vertex *head)
        {
             int time=0;
             for(struct vertex *t=head;t;t=t->next)
             {
                        
                  if(t->col=='w')
                  {
                                 dfs_visit(t,head,time);
                                 }
                                 }
                                 
                                 }
           
           int main()
           {
           int a[50][50],vno;
           struct vertex *head;
           head=NULL;
           cout<<"\nenter the no. of vertices"<<endl;
           cin>>vno;
           
           cout<<"\nenter the adjacency matrix row wise"<<endl;
           for(int i=0;i<vno;i++)
           {
                   cout<<"for row "<<i+1<<endl;
                   for(int j=0;j<vno;j++)
                   cin>>a[i][j];
                   }
                   head=ins_vert(vno,a,head);
                   dfs(head);
                   
                   for(struct vertex *temp=head;temp;temp=temp->next)
                   {
                              cout<<"vertex no."<<temp->vertno<<endl;
                              cout<<"start time:"<<temp->d<<endl;
                              cout<<"end time:"<<temp->f<<endl;
                              cout<<endl;
                              }
                              system("PAUSE");
                              return 0;
                              }
                              
           
                                                
                                                
                                                                                                                                                         
                                                                                                                                                                                
                                       
                                       
               
      
       
