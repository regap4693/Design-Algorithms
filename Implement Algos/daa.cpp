#include<iostream>
using namespace std;
struct tri
{
       float x1,y1,x2,y2,x3,y3;
       float area;
       struct tri *next;
       }; 
       
       
struct list
{
       struct tri *top;
       struct list *next;
       struct list *prev;
       };
       
      
       
list* create_node(struct tri p)
{
      struct list *temp;
      temp=new list;
      
      struct tri *temp1;
      temp1=new tri;
      temp1->area=p.area;
      temp1->x1=p.x1;
      temp1->x2=p.x2;
      temp1->x3=p.x3;
      temp1->y1=p.y1;
      temp1->y2=p.y2;
      temp1->y3=p.y3;
      temp1->next=NULL;
      
      
      temp->top=temp1;
      temp->next=NULL;
      
      return(temp);
      }
      
      
tri* create_pile(struct tri p)
{
     struct tri *temp1;
      
      temp1=new tri;
      temp1->area=p.area;
      temp1->x1=p.x1;
      temp1->x2=p.x2;
      temp1->x3=p.x3;
      temp1->y1=p.y1;
      temp1->y2=p.y2;
      temp1->y3=p.y3;
      temp1->next=NULL;
     
     return(temp1);
     }
     
void ins_node(struct list *head,struct tri s)
{
     
     struct list *temp;
                      temp=create_node(s);
                      if(head==NULL)
                      {
                                    head=temp;
                                    }
                                    else
                                    {
                                        struct list *p;
                                        p=head;
                                        while(p->next)
                                        p=p->next;
                                        temp->prev=p;
                                        p->next=temp;
                                        }
                                        
                                        }
                                        
void push(struct list *k,struct tri p)
{
     struct tri *st,*temp1;
     temp1=new tri;
     st=k->top;
     while(st->next)
     st=st->next;
     
     temp1->area=p.area;
      temp1->x1=p.x1;
      temp1->x2=p.x2;
      temp1->x3=p.x3;
      temp1->y1=p.y1;
      temp1->y2=p.y2;
      temp1->y3=p.y3;
      temp1->next=NULL;
      
     
     st->next=temp1;
}
            
       
float area(struct tri st)
{
      float area;
      
      area=((st.x1*(st.y2-st.y3))+(st.x2*(st.y3-st.y1))+(st.x3*(st.y1-st.y2)))/2.0;
      
       if(area<0)
       return(-area);
       else
       return(area);
       }
       
       
void sort(struct tri *p,int n)
{
     for(int j=1;j<n;j++)
     {
             struct tri key=*(p+j);
             int i=j-1;
             while((i>=0)&&((p+i)->area>key.area))
             {
             *(p+i+1)=*(p+i);
             i=i-1;
             }
             *(p+i+1)=key;
             }
             }
             
int stack_num(struct tri *p)
{
    int n=0;
    struct tri *k;
    k=p;
    while(k)
    {
            n++;
            k=k->next;
            }
            return(n);
            }
            
void test_tri(struct tri &t1,struct tri &t2,struct tri &t3,struct tri p,float x,float y)
{
     t1.x1=p.x1;
    t1.x2=p.x2;
    t1.y1=p.y1;
    t1.y2=p.y2;
    t1.x3=x;
    t1.y3=y;
    t1.area=area(t1);
    
    t2.x1=p.x1;
    t2.x2=p.x3;
    t2.y1=p.y1;
    t2.y2=p.y3;
    t2.x3=x;
    t2.y3=y;
    t2.area=area(t2);
    
    t3.x1=p.x2;
    t3.x2=p.x3;
    t3.y1=p.y2;
    t3.y2=p.y3;
    t3.x3=x;
    t3.y3=y;
    t3.area=area(t3);
}

int check(struct list *s,struct tri p)
{
    struct tri *st,t1,t2,t3;
    st=s->top;int p1_in=0,p2_in=0,p3_in=0;
    while(st->next)
    st=st->next;
    
    
    
    
    
    test_tri(t1,t2,t3,p,st->x1,st->y1);
    
        if((t1.area+t2.area+t3.area)==area(p))
        p1_in=1;
        
    
   
   
   
    test_tri(t1,t2,t3,p,st->x2,st->y2);
    
    if((t1.area+t2.area+t3.area)==area(p))
        p2_in=1;
        
        
        
        
        
        
        test_tri(t1,t2,t3,p,st->x3,st->y3);
    
    
        if((t1.area+t2.area+t3.area)==area(p))
        p3_in=1;
         
        
        
       
        
        if((p1_in==1)&&(p2_in==1)&&(p3_in==1))
        {
                                              cout<<"inside"<<endl;
                                              return(1);
                                              }
        else
        {
            if((p1_in==0)&&(p2_in==0)&&(p3_in==0))
            
                {                                 cout<<"outside"<<endl; 
                                                  return(2);
                                                  }                
            
            }
}
    
        
        
        
        
    
    
            

        
       
 int main()
 {
     int n,n1,n2,flag3=0;
     struct tri *st;
     struct list *head;
     head=NULL;
     st=new tri;
     cin>>n;
     for(int i=0;i<n;i++)
     {
             cout<<"\nfor triangle"<<i+1<<endl;
             
              cin>>(st+i)->x1;
              cin>>(st+i)->y1;
              cin>>(st+i)->x2;
              cin>>(st+i)->y2;
              cin>>(st+i)->x3;
              cin>>(st+i)->y3;
              
              (st+i)->area=area(*(st+i));  
              }
              sort(st,n);
              cout<<"area:"<<endl;
              for(int i=0;i<n;i++)
              {
                      cout<<(st+i)->x1<<" "<<(st+i)->y1<<endl;
                      cout<<(st+i)->area<<endl;
                      }
              
              
               head=create_node(*st);     
                     for(int i=1;i<n;i++)
              {
                     cout<<"tri no. "<<i+1<<":";
                    int flag1=0,flag2=0;
                      struct tri s=*(st+i);
                        struct list *x;
                        x=head;
                        while(x)
                        {
                                cout<<"check "<<i+1<<"=>"<<endl;
                        int n1=check(x,s);
                        
                        switch(n1)
                        {
                                 case 1:push(x,s);
                                 flag1=1;
                                 break;
                                 case 2:flag2=1;
                                 break;
                                 case 3:cout<<"ERROR";
                                 flag3=1;
                                 break;
                                 default:"program corrupt";
                                 }
                                 cout<<endl<<endl;
                                            
                                 x=x->next;
                                 
                                 }
                                 
                                 
                                 
                                 if((flag1==0)&&(flag2==1))
                                 {
                                                           cout<<"insert node"<<endl;
                                                           ins_node(head,s);
                                 
                                 }
                                 }
                                
                                if(flag3!=1)
                                {
                                
                                struct list *x=head->next;
                                int nshades;
                                n2=stack_num(head->top);
                                cout<<n2<<endl;
                                nshades=n2;
                                while(x)
                                { 
                                
                                n2=stack_num(x->top);
                                if(nshades<n2)
                                nshades=n2;
                                cout<<n2<<endl;
                                
                                 x=x->next;
                                 }
                                 
                                 cout<<"no.of shades=>"<<nshades+1<<endl;
                                                  
                                                  }
                    
              
                      system("PAUSE");
                      return 0;
                      }
                      
