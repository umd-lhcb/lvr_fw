// C++ Program to generate CRC codeword 
#include<stdio.h> 
#include<math.h> 
  
using namespace std; 
extern "C"
  
// function to compute CRC and codeword 
int64_t CRC(int64_t dword, int64_t gen){ 
  int64_t glength = log2(gen)+1; 
  int64_t dlength = log2(dword)+1;
  
  // append 0s to crc 
  int64_t crc = dword << (glength-1);        
  
  // shft specifies the no. of least  
  // significant bits not being XORed 
  int64_t shft = (int64_t) ceill(log2l(crc+1)) - glength;   
  int64_t rem; 
  
  while ((crc >= gen) || (shft >= 0)){ 
  
    // bitwise XOR the MSBs of crc with generator 
    // replace the operated MSBs from the crc with 
    // remainder generated  
    rem = (crc >> shft) ^ gen;                 
    crc = (crc & ((1 << shft) - 1)) | (rem << shft); 
  
    // change shft variable 
    shft = (int64_t) ceill(log2l(crc + 1)) - glength; 
  } 
  
  return crc;
} 
  
