// C++ Program to generate CRC codeword 
#include<stdio.h> 
#include<iostream> 
#include<math.h> 
  
using namespace std; 
  
// function to convert integer to binary string 
string toBin(long long int num){
  int nbits = 0;
  string bin = ""; 
  while (num){
    if((nbits%4)==0  && nbits!=0)bin = " " + bin;
    if (num & 1){       
      bin = "1" + bin; 
    } else
      bin = "0" + bin; 
    num = num>>1;
    nbits++;
  } 
  return bin; 
} 
  
// function to convert binary string to decimal 
long long int toDec(string bin){ 
    long long int num = 0; 
    for (unsigned int i=0; i<bin.length(); i++){ 
        if (bin.at(i)=='1') 
            num += 1 << (bin.length() - i - 1); 
    } 
    return num; 
} 
  
// function to compute CRC and codeword 
void CRC(string dataword, string generator){ 
    int l_gen = generator.length(); 
    long long int gen = toDec(generator); 
  
    long long int dword = toDec(dataword); 
  
     // append 0s to dividend 
    long long int dividend = dword << (l_gen-1);        
  
    // shft specifies the no. of least  
    // significant bits not being XORed 
    int shft = (int) ceill(log2l(dividend+1)) - l_gen;   
    long long int rem; 
  
    while ((dividend >= gen) || (shft >= 0)){ 
  
        // bitwise XOR the MSBs of dividend with generator 
        // replace the operated MSBs from the dividend with 
        // remainder generated  
        rem = (dividend >> shft) ^ gen;                 
        dividend = (dividend & ((1 << shft) - 1)) | (rem << shft); 
  
        // change shft variable 
        shft = (int) ceill(log2l(dividend + 1)) - l_gen; 
    } 
  
    // finally, AND the initial dividend with the remainder (=dividend) 
    long long int codeword = (dword << (l_gen - 1)) | dividend; 
    cout << "Remainder: " << toBin(dividend) << endl; 
    cout << "Codeword : " << toBin(codeword) << endl; 
} 
  
// function to compute CRC and codeword 
long CRC(long dword, long gen){ 
  int glength = log2(gen)+1; 
  int dlength = log2(dword)+1;
  
  // append 0s to crc 
  long crc = dword << (glength-1);        
  
  // shft specifies the no. of least  
  // significant bits not being XORed 
  int shft = (int) ceill(log2l(crc+1)) - glength;   
  long long int rem; 
  
  while ((crc >= gen) || (shft >= 0)){ 
  
    // bitwise XOR the MSBs of crc with generator 
    // replace the operated MSBs from the crc with 
    // remainder generated  
    rem = (crc >> shft) ^ gen;                 
    crc = (crc & ((1 << shft) - 1)) | (rem << shft); 
  
    // change shft variable 
    shft = (int) ceill(log2l(crc + 1)) - glength; 
  } 
  
  cout<<endl;
  cout<<"Data:        0x"<<hex<<dword<<" ("<<toBin(dword)<<")"<<endl;
  cout<<"Polynomial:  0x"<<hex<<gen<<" ("<<toBin(gen)<<")"<<endl;
  cout<<"CRC:         0x"<<hex<<crc<<" ("<<toBin(crc)<<")"<<endl<<endl;

  return crc;
} 
  
void calc_crc(long dword, long gen = 0x67){ 
  CRC(dword, gen); 
} 
