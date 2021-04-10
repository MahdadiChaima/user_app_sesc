void correct_answer(Map corr,String corr_answer){
int i;
for(i=1;i<4;i++){
  if(corr['ans$i']==corr_answer){
    corr['ans$i']=true;
  }
}
}