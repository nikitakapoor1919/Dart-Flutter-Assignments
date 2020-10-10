/* 
Q5. Find the Anagram String
“silent”
“listen”
*/
bool isAnagram(String str1, String str2) {
  String normalize(String str) => (str
          .toLowerCase()
          .replaceAll(RegExp(r'[^a-z0-9]', caseSensitive: false), '')
          .split('')
            ..sort()
  )
      .join('');
  return normalize(str1) == normalize(str2);
}

void main(){
  if(isAnagram("silent","listen")==true)
    print("It is Anagram String");
  else
    print("Not an Anagram String");
}