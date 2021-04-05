int findMID(List x){
  int a = x.length;
  if(a&1 == 1) return (a-1)~/2;
  else return a~/2;
}

int findFirstQ(int mid) {
  return mid~/2;
}

double iqr(double one, double two){
  return two-one;
}

double lowerbound(double a, double b){
  return a - 1.5*iqr(a,b);
}

double upperbound(double a, double b){
  return b + 1.5*iqr(a,b);
}