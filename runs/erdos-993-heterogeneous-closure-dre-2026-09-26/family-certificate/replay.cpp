#include <gmpxx.h>
#include <array>
#include <vector>
#include <map>
#include <iostream>
#include <stdexcept>
#include <string>
using Z=mpz_class;
using V=std::vector<Z>;
static const std::array<std::vector<unsigned long>,5> B{{
 {},{1,2}, {1,3,1}, {1,4,3,1}, {1,5,6,4,1}}};
static const std::array<std::vector<unsigned long>,5> F{{
 {},{}, {1}, {2,1}, {3,3,1}}};
static const std::vector<unsigned long> G={1,2};
void need(bool v,const char*why){if(!v)throw std::runtime_error(why);}
Z get(const V&v,int j){return j<0||j>=int(v.size())?Z(0):v[j];}
Z coeff(const std::vector<unsigned long>&a,const V&v,int j){
 Z z=0;for(int i=0;i<int(a.size());++i)if(j>=i&&j-i<int(v.size()))mpz_addmul_ui(z.get_mpz_t(),v[j-i].get_mpz_t(),a[i]);return z;
}
V multiply(const V&v,const std::vector<unsigned long>&a){
 V w(v.size()+a.size()-1);
 for(int j=0;j<int(v.size());++j)for(int k=0;k<int(a.size());++k)
   mpz_addmul_ui(w[j+k].get_mpz_t(),v[j].get_mpz_t(),a[k]);
 return w;
}
// Exact constant-one factor removal, unrelated to the producer's DQ'=AQ method.
V divide(const V&v,const std::vector<unsigned long>&a){
 need(a[0]==1&&v.size()>=a.size(),"bad exact division input");
 int d=int(a.size())-1;V w(v.size()-d);
 for(int j=0;j<int(w.size());++j){w[j]=v[j];for(int k=1;k<=d&&k<=j;++k)
   mpz_submul_ui(w[j].get_mpz_t(),w[j-k].get_mpz_t(),a[k]);}
 for(int j=int(w.size());j<int(v.size());++j){Z t=0;for(int k=1;k<=d;++k)if(j>=k&&j-k<int(w.size()))
   mpz_addmul_ui(t.get_mpz_t(),w[j-k].get_mpz_t(),a[k]);
   need(t==v[j],"nonzero exact-division tail");}
 return w;
}
V replace(const V&q,int from,int to){return multiply(divide(q,B[from]),B[to]);}
struct Bin {
 std::map<int,V> rows;
 const V& row(int n){auto it=rows.find(n);if(it!=rows.end())return it->second;
   V a(n+1);a[0]=1;for(int j=0;j<n;++j){Z t=a[j]*(n-j);Z rem=t%(j+1);need(rem==0,"binomial nondivision");a[j+1]=t/(j+1);}return rows.emplace(n,std::move(a)).first->second;}
};
int main(int argc,char**argv){try{
 need(argc==3,"usage: replay m_min m_max");int lo=std::stoi(argv[1]),hi=std::stoi(argv[2]);
 need(lo>=1&&hi>=lo&&hi<=265,"bad range");
 long long totalp=0,totalr=0,totalnon=0;
 for(int m=lo;m<=hi;++m){
   Bin bin;V outer{1};for(int t=0;t<m;++t)outer=multiply(outer,B[2]);
   long long np=0,nr=0,nn=0;bool have=false;Z maxS;std::array<int,3> maxC{};int maxP=0,maxX=0;
   for(int a2=m;a2>=0;--a2){V q=outer;
     for(int a3=0;a3<=m-a2;++a3){
       int a4=m-a2-a3;int N=2*a2+3*a3+4*a4;
       need(int(q.size())==N+1&&q[0]==1&&q[N]==1,"Q degree/leading failure");
       for(const auto&z:q)need(z>0,"Q support failure");
       const V& bn=bin.row(N);const V& bn1=bin.row(N+1);
       auto parent=[&](int j)->Z{return get(q,j)+2*get(q,j-1)+get(bn1,j-1);};
       int x=-1;for(int j=0;j<=N+2;++j){if(parent(j+1)<parent(j)){x=j;break;}}
       need(x>=0,"terminal descent absent");++np;
       int upper=std::min((2*N+4)/3,N/2+1);
       if(x+2<=upper){
         std::array<V,5> h;std::array<int,5> c={0,0,a2,a3,a4};
         for(int r=2;r<=4;++r)if(c[r]){h[r]=divide(q,B[r]);need(int(h[r].size())==N-r+1&&h[r][0]>0&&h[r].back()==1,"H support failure");}
         auto endpoint=[&](int j)->Z{return get(q,j)+get(q,j-1)+get(bn,j-1);};
         for(int p=x+2;p<=upper;++p){
           need(3*p<2*(N+2)+1,"rank guard failure");
           bool e0=endpoint(p+1)<endpoint(p);
           Z db=get(bn,p-1)-get(bn,p-2);Z S=e0?db:Z(0);int tags=e0?1:0;
           for(int r=2;r<=4;++r)if(c[r]){
             auto tipdel=[&](int j)->Z{Z a=coeff(B[r-1],h[r],j)+2*coeff(B[r-1],h[r],j-1);return a+get(bn,j-1);};
             bool e=tipdel(p+1)<tipdel(p);
             if(e){auto mark=[&](int j)->Z{return coeff(F[r],h[r],j)+2*coeff(F[r],h[r],j-1);};
               S+=(mark(p-1)-mark(p-2)+db)*(r*c[r]);tags+=r*c[r];}
           }
           ++nr;if(tags!=N+1)++nn;
           if(!have||S>maxS){have=true;maxS=S;maxC={a2,a3,a4};maxP=p;maxX=x;}
           if(S>0){std::cout<<"{\"positive\":true,\"m\":"<<m<<",\"counts\":["<<a2<<","<<a3<<","<<a4<<"],\"p\":"<<p<<",\"x\":"<<x<<",\"S\":\""<<S<<"\"}\n";return 3;}
         }
       }
       if(a3<m-a2)q=replace(q,4,3);
     }
     if(a2>0)outer=replace(outer,2,4);
   }
   need(np==1LL*(m+1)*(m+2)/2,"profile coverage failure");
   totalp+=np;totalr+=nr;totalnon+=nn;
   std::cout<<"{\"m\":"<<m<<",\"profiles\":"<<np<<",\"rows\":"<<nr<<",\"rows_not_all_selected\":"<<nn<<",\"max_S\":";
   if(have)std::cout<<"\""<<maxS<<"\",\"max_counts\":["<<maxC[0]<<","<<maxC[1]<<","<<maxC[2]<<"],\"max_p\":"<<maxP<<",\"max_x\":"<<maxX;
   else std::cout<<"null";
   std::cout<<"}\n"<<std::flush;
 }
 std::cout<<"{\"complete\":true,\"m_min\":"<<lo<<",\"m_max\":"<<hi<<",\"rank_mode\":\"lower\",\"profiles\":"<<totalp<<",\"rows\":"<<totalr<<",\"rows_not_all_selected\":"<<totalnon<<"}\n";
 }catch(const std::exception&e){std::cerr<<e.what()<<"\n";return 2;}return 0;}
