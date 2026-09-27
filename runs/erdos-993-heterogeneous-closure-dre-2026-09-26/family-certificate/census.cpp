#include <gmpxx.h>
#include <array>
#include <vector>
#include <iostream>
#include <stdexcept>
#include <string>
#include <chrono>
using Z=mpz_class;using P=std::vector<long>;
P mul(P a,P b){P c(a.size()+b.size()-1);for(size_t i=0;i<a.size();++i)for(size_t j=0;j<b.size();++j)c[i+j]+=a[i]*b[j];return c;}
P deriv(P a){P c(a.size()-1);for(size_t i=1;i<a.size();++i)c[i-1]=i*a[i];return c;}
const std::array<P,5> B={P{},P{1,2},P{1,3,1},P{1,4,3,1},P{1,5,6,4,1}};
const std::array<P,5> F={P{},P{},P{1},P{2,1},P{3,3,1}};
const P G={1,2};
Z at(const std::vector<Z>&a,int j){return j<0||j>=int(a.size())?Z(0):a[j];}
Z coef(const P&u,const std::vector<Z>&h,int j){Z a=0;for(int s=0;s<int(u.size());++s)if(j>=s&&j-s<int(h.size()))mpz_addmul_ui(a.get_mpz_t(),h[j-s].get_mpz_t(),u[s]);return a;}
void require(bool x,const char*s){if(!x)throw std::runtime_error(s);}
int main(int argc,char**argv){try{
 require(argc>=4,"usage: census m_min m_max all|lower [emit]");int lo=std::stoi(argv[1]),hi=std::stoi(argv[2]);std::string mode=argv[3];bool emit=argc==5&&std::string(argv[4])=="emit";require(lo>=1&&hi>=lo&&hi<=1000&&(mode=="all"||mode=="lower"),"bad range/mode");
 auto start=std::chrono::steady_clock::now();P d=mul(mul(B[2],B[3]),B[4]);std::array<P,5>a;
 for(int r=2;r<=4;++r){P t=deriv(B[r]);for(int s=2;s<=4;++s)if(s!=r)t=mul(t,B[s]);a[r]=t;}
 std::vector<std::vector<Z>> bin(4*hi+2);for(int n=0;n<int(bin.size());++n){bin[n].resize(n+1);bin[n][0]=1;for(int k=0;k<n;++k){Z t=bin[n][k]*(n-k);require(mpz_tdiv_q_ui(bin[n][k+1].get_mpz_t(),t.get_mpz_t(),k+1)==0,"binomial remainder");}}
 long long total_profiles=0,total_rows=0,total_unselected=0;
 std::vector<Z>q;std::array<std::vector<Z>,5> h;
 for(int m=lo;m<=hi;++m){long long profiles=0,rows=0,unselected=0;bool have=false;Z worst;std::array<int,3>wc{};int wp=0,wx=0;
 for(int a2=0;a2<=m;++a2)for(int a3=0;a3<=m-a2;++a3){std::array<int,5>c={0,0,a2,a3,m-a2-a3};int N=2*c[2]+3*c[3]+4*c[4];P A(9);for(int r=2;r<=4;++r)for(int l=0;l<9;++l)A[l]+=c[r]*a[r][l];
 q.resize(N+1);q[0]=1;for(int k=0;k<N;++k){Z t=0;for(int l=0;l<=8&&l<=k;++l){long w=A[l]-d[l+1]*(k-l);if(w>=0)mpz_addmul_ui(t.get_mpz_t(),q[k-l].get_mpz_t(),w);else mpz_submul_ui(t.get_mpz_t(),q[k-l].get_mpz_t(),-w);}require(mpz_tdiv_q_ui(q[k+1].get_mpz_t(),t.get_mpz_t(),k+1)==0,"Q recurrence remainder");require(q[k+1]>0,"Q support failure");}
 require(q[N]==1,"Q leading coefficient");
 auto parent=[&](int j)->Z{return at(q,j)+2*at(q,j-1)+at(bin[N+1],j-1);};
 int x=-1;for(int j=0;j<=N+2;++j)if(parent(j+1)<parent(j)){x=j;break;}require(x>=0,"no terminal descent");
 ++profiles;
 int upper=(2*N+4)/3;if(mode=="lower")upper=std::min(upper,N/2+1);
 if(emit){std::cout<<"{\"control\":true,\"counts\":["<<c[2]<<","<<c[3]<<","<<c[4]<<"],\"N\":"<<N<<",\"x\":"<<x<<",\"Q\":[";for(int k=0;k<=N;++k){if(k)std::cout<<",";std::cout<<"\""<<q[k]<<"\"";}std::cout<<"]}\n";}
 if(x+2>upper)continue;
 for(int r=2;r<=4;++r)if(c[r]){h[r].resize(N+1);for(int j=0;j<=N;++j){h[r][j]=q[j];for(int s=1;s<=r&&s<=j;++s)mpz_submul_ui(h[r][j].get_mpz_t(),h[r][j-s].get_mpz_t(),B[r][s]);require(j<=N-r?h[r][j]>0:h[r][j]==0,"H division/support failure");}}
 auto endpoint=[&](int j)->Z{return at(q,j)+at(q,j-1)+at(bin[N],j-1);};
 for(int p=x+2;p<=upper;++p){require(3*p<2*(N+2)+1,"upper guard");Z db=at(bin[N],p-1)-at(bin[N],p-2);bool e0=endpoint(p+1)<endpoint(p);Z S=e0?db:Z(0);int tags=e0?1:0;std::array<bool,5>flags{};
 for(int r=2;r<=4;++r)if(c[r]){P u=mul(G,B[r-1]);Z ap=coef(u,h[r],p)+at(bin[N],p-1);Z ap1=coef(u,h[r],p+1)+at(bin[N],p);bool e=ap1<ap;flags[r]=e;if(e){P t=mul(G,F[r]);Z v=coef(t,h[r],p-1)-coef(t,h[r],p-2)+db;S+=v*(r*c[r]);tags+=r*c[r];}}
 if(emit){std::cout<<"{\"control_row\":true,\"counts\":["<<c[2]<<","<<c[3]<<","<<c[4]<<"],\"p\":"<<p<<",\"x\":"<<x<<",\"selected_tags\":"<<tags<<",\"flags\":["<<e0<<","<<flags[2]<<","<<flags[3]<<","<<flags[4]<<"],\"S\":\""<<S<<"\"}\n";}
 ++rows;if(tags!=N+1)++unselected;if(!have||S>worst){have=true;worst=S;wc={c[2],c[3],c[4]};wp=p;wx=x;}
 if(S>0){std::cout<<"{\"failure\":true,\"m\":"<<m<<",\"counts\":["<<c[2]<<","<<c[3]<<","<<c[4]<<"],\"N\":"<<N<<",\"alpha\":"<<N+2<<",\"x\":"<<x<<",\"p\":"<<p<<",\"selected_tags\":"<<tags<<",\"S\":\""<<S<<"\"}\n";return 3;}
 }
 }
 require(profiles==1LL*(m+1)*(m+2)/2,"profile coverage");total_profiles+=profiles;total_rows+=rows;total_unselected+=unselected;
 std::cout<<"{\"m\":"<<m<<",\"profiles\":"<<profiles<<",\"rows\":"<<rows<<",\"rows_not_all_selected\":"<<unselected<<",\"max_S\":";if(have)std::cout<<"\""<<worst<<"\",\"max_counts\":["<<wc[0]<<","<<wc[1]<<","<<wc[2]<<"],\"max_p\":"<<wp<<",\"max_x\":"<<wx;else std::cout<<"null";std::cout<<"}\n"<<std::flush;
 }
 double seconds=std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count();std::cout<<"{\"complete\":true,\"m_min\":"<<lo<<",\"m_max\":"<<hi<<",\"rank_mode\":\""<<mode<<"\",\"profiles\":"<<total_profiles<<",\"rows\":"<<total_rows<<",\"rows_not_all_selected\":"<<total_unselected<<",\"seconds\":"<<seconds<<"}\n";
 }catch(const std::exception&e){std::cerr<<e.what()<<"\n";return 2;}return 0;}
