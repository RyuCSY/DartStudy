//영어에서의 모음은 a, e, i, o, u 다섯가지이다
const vowelList = ['a', 'e', 'i', 'o', 'u'];

class Word {
  final String word;

  Word(this.word);

  ///실습 2 i 번째 글자가 자음인지 알려주는 isConsonant() 함수를 완성하시오
  bool isConsonant(int i) {
    return !isVowel(i);
  }

  ///실습 1 i 번째 글자가 모음인지 알려주는 isVowel() 함수를 완성하시오
  // 영어에서의 모음은 a, e, i, o, u 다섯가지이다
  ///
  bool isVowel(int i) {
    if (word.length <= i - 1) {
      throw Exception('입력하신 ${i} 는 $word 의 글자 수를 넘었습니다.');
    }
    return vowelList.contains(word.substring(i, i + 1).toLowerCase());
  }
}

main() {
  Word vowelChecker = Word('word');

  for (int i = 0; i < vowelChecker.word.length; i++) {
    print('index ${i} alphabet isVowel = ${vowelChecker.isVowel(i)}');
  }

  for (int i = 0; i < vowelChecker.word.length; i++) {
    print('index ${i} alphabet isConsonant = ${vowelChecker.isConsonant(i)}');
  }
}
